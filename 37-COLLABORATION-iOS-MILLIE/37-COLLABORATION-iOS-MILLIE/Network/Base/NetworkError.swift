//
//  NetworkError.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/25/25.
//

import Foundation

enum NetworkError: LocalizedError {
    case apiError(message: String)
    case badRequest                 // 400
    case notFound                   // 404
    case internalServerError        // 500
    case decodingError
    case networkFail
    case urlError
    case httpURLResponseError
    
    var errorDescription: String? {
        switch self {
        case .apiError(let message):
            return message
        case .badRequest:
            return "잘못된 요청입니다"
        case .notFound:
            return "리소스를 찾을 수 없습니다"
        case .internalServerError:
            return "서버 오류가 발생했습니다"
        case .decodingError:
            return "데이터 변환 중 오류가 발생했습니다"
        case .networkFail:
            return "네트워크 연결에 실패했습니다"
        case .urlError:
            return "사용할 수 없는 URL입니다"
        case .httpURLResponseError:
            return "HTTPURLResponse로 타입 캐스팅 불가"
        }
    }
}
