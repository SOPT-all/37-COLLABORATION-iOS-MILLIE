//
//  BaseService.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/25/25.
//


import Foundation
import os

class BaseService {
    
    private static var logger: Logger {
        Logger(subsystem: Bundle.main.bundleIdentifier ?? "Millie", category: "Network.Service")
    }
    
    func requestDecodable<Response: Decodable, Target: BaseTargetType>(
        target: Target
    ) async -> Result<Response, NetworkError> {
        
        
        // MARK: - ✅ 네트워크 Request 세팅
        
        let url = target.url
        var request = URLRequest(url: url)
        request.httpMethod = target.method.key
        
        // 헤더 설정
        if let headers = target.headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        // 바디 설정
        if let body = target.body {
            do {
                let bodyData = try JSONEncoder().encode(body)
                request.httpBody = bodyData
            } catch {
                Self.logger.error("❌ Failed to encode request body: \(error.localizedDescription)")
                return .failure(.badRequest)
            }
        }
        
        
        // MARK: - ✅ 네트워크 검증을 위한 로그 출력
        
        Self.logger.debug("➡️ [REQUEST] \(request.httpMethod ?? "") \(request.url?.absoluteString ?? "")")
        if let headers = request.allHTTPHeaderFields {
            Self.logger.debug("🧾 Headers: \(headers.description)")
        }
        if let body = request.httpBody,
           let bodyString = String(data: body, encoding: .utf8) {
            Self.logger.debug("📦 Body: \(bodyString)")
        }
        
        
        // MARK: - ✅ 네트워크 요청
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                Self.logger.error("❌ Invalid HTTPURLResponse")
                return .failure(.httpURLResponseError)
            }
            
            Self.logger.debug("⬅️ [RESPONSE] Status Code: \(httpResponse.statusCode)")
            if let responseBody = String(data: data, encoding: .utf8) {
                Self.logger.debug("📨 Response Body: \(responseBody)")
            }
            
            switch httpResponse.statusCode {
            case 200...299:
                do {
                    let decoded = try JSONDecoder().decode(Response.self, from: data)
                    return .success(decoded)
                } catch {
                    Self.logger.error("❌ Decoding Error: \(error.localizedDescription)")
                    if let raw = String(data: data, encoding: .utf8) {
                        Self.logger.error("📨 Raw Response Data: \(raw)")
                    }
                    return .failure(.decodingError)
                }
            case 400:
                return .failure(.badRequest)
            case 404:
                return .failure(.notFound)
            case 500...599:
                return .failure(.internalServerError)
            default:
                return .failure(.networkFail)
            }
        } catch {
            Self.logger.error("❌ Network Error: \(error.localizedDescription)")
            return .failure(.networkFail)
        }
    }
}
