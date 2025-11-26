//
//  HTTPMethodType.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/25/25.
//

enum HTTPMethodType {
    case get
    case post
    
    var key: String {
        switch self {
        case .get:
            "GET"
        case .post:
            "POST"
        }
    }
}
