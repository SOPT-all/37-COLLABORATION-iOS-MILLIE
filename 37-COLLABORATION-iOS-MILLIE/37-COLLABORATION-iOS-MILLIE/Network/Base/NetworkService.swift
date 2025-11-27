//
//  NetworkService.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/25/25.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    private init() { }
    
    let detailService: DetailServiceProtocol = DetailService()
}
