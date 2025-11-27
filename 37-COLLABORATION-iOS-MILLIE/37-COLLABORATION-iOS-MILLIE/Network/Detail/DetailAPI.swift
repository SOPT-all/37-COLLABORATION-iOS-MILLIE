//
//  DetailAPI.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/27/25.
//


import Foundation

enum DetailAPI {
    case toggleReviewLike(reviewId: Int)
}

extension DetailAPI: BaseTargetType {
    var headerType: HeaderType {
        return .noneHeader
    }
    
    var path: String {
        switch self {
        case .toggleReviewLike(let reviewId):
            return "/reviews/\(reviewId)/like"
        }
    }
    
    var method: HTTPMethodType {
        switch self {
        case .toggleReviewLike:
            return .post
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .toggleReviewLike:
            return nil
        }
    }
}
