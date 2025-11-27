//
//  SearchService.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 송성용 on 11/27/25.
//

import Foundation

protocol SearchServiceProtocol {
    func searchBooks(keyword: String) async -> Result<SearchResponseDTO, NetworkError>
}

final class SearchService: BaseService, SearchServiceProtocol {
    func searchBooks(keyword: String) async -> Result<SearchResponseDTO, NetworkError> {
        return await requestDecodable(target: SearchAPI.searchBooks(keyword: keyword))
    }
}
