//
//  DetailAPI.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/27/25.
//


import Foundation

enum DetailAPI {
    case getBookDetailInfo(bookId: Int)
}

extension DetailAPI: BaseTargetType {
    var headerType: HeaderType {
        return .noneHeader
    }
    
    var path: String {
        switch self {
        case .getBookDetailInfo(let bookId):
            return "/books/\(bookId)"
        }
    }
    
    var method: HTTPMethodType {
        switch self {
        case .getBookDetailInfo:
            return .get
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getBookDetailInfo:
            return nil
        }
    }
}
