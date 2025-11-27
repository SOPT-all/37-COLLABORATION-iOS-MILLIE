//
//  BookDetailModel.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김호성 on 2025.11.20.
//

import Foundation

typealias BookDetailInfoResponseDTO = BaseResponseDTO<BookDetailInfoData>

struct BookDetailInfoData: Decodable {
    let bookId: Int
    let bookCoverImageUrl: URL
    let bookTitle: String
    let bookAuthor: String
    let bookType: String
    let publishedDate: String
    let bookRate: Float
    let totalReviewCount: Int
    let completionRate: Int
    let bookDescription: String
    let reviews: [ToggleReviewLikeData]
}
