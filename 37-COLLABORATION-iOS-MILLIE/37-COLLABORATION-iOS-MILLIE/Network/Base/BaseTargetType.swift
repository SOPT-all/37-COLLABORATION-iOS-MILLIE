//
//  BaseTargetType.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/25/25.
//

import Foundation

enum HeaderType {
    case noneHeader
    case accessTokenHeader
}

protocol BaseTargetType {
    var headerType: HeaderType { get }
    var path: String { get }
    var method: HTTPMethodType { get }
    var body: Encodable? { get }
    var queryItems: [URLQueryItem]? { get }
}

extension BaseTargetType {
    
    var baseURL: URL {
        guard let urlString = Bundle.main.infoDictionary?["BASE_URL"] as? String,
              let url = URL(string: urlString) else {
            fatalError("🚨Base URL을 찾을 수 없습니다🚨")
        }
        return url
    }
    
    var headers: [String: String]? {
        var headers: [String: String] = [
            "Content-Type": "application/json"
        ]
        
        switch headerType {
        case .noneHeader:
            return headers
        case .accessTokenHeader:
            return nil
        }
    }
    
    var body: Encodable? {
        return nil
    }

    var url: URL {
        let fullURL = baseURL.appending(path: path, directoryHint: .notDirectory)
        var components = URLComponents(url: fullURL, resolvingAgainstBaseURL: false)
        components?.queryItems = queryItems
        return components?.url ?? fullURL
    }
}
