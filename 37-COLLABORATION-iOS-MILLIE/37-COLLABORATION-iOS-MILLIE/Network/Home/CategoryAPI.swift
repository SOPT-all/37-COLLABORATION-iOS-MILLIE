//
//  CategoryAPITarget.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 임소은 on 11/27/25.
//

import Foundation

enum CategoryAPI {
    case getCategoryList
}

extension CategoryAPI: BaseTargetType {

    var headerType: HeaderType {
        return .noneHeader
    }

    var path: String {
        switch self {
        case .getCategoryList:
            return "/categories"
        }
    }

    var method: HTTPMethodType {
        return .get
    }

    var queryItems: [URLQueryItem]? {
        return nil
    }
}
