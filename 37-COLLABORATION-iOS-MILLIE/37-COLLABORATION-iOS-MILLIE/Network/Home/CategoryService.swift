//
//  CategoryService.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 임소은 on 11/27/25.
//

import Foundation

protocol CategoryServiceProtocol {
    func getCategoryList() async -> Result<CategoryResponseDTO, NetworkError>
}

final class CategoryService: BaseService, CategoryServiceProtocol {
    func getCategoryList() async -> Result<CategoryResponseDTO, NetworkError> {
        return await requestDecodable(target: CategoryAPI.getCategoryList)
    }
}
