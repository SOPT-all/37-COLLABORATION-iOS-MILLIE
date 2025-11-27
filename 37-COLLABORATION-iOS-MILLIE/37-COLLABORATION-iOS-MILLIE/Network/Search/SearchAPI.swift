//
//  SearchAPI.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 송성용 on 11/27/25.
//

import Foundation

enum SearchAPI {
    case searchBooks(keyword: String)
}

extension SearchAPI: BaseTargetType {
    var headerType: HeaderType {
        return .noneHeader
    }
    
    var path: String {
        switch self {
        case .searchBooks:
            return "/books"
        }
    }
    
    var method: HTTPMethodType {
        switch self {
        case .searchBooks:
            return .get
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .searchBooks(let keyword):
            return [URLQueryItem(name: "keyword", value: keyword)]
        }
    }
}
