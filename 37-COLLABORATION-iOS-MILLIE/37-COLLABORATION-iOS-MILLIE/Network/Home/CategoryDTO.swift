//
//  CategoryDTO.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 임소은 on 11/27/25.
//

import Foundation

typealias CategoryResponseDTO = BaseResponseDTO<[CategoryListData]>

struct CategoryListData: Decodable {
    let categoryId: Int
    let title: String
    let description: String
    let imageUrl: String
}


// DTO → Domain 변환
extension CategoryListData {
    func toDomain() -> BookCategoryModel {
        return BookCategoryModel(
            categoryId: categoryId,
            title: title,
            description: description,
            imageURL: imageUrl
        )
    }
}
