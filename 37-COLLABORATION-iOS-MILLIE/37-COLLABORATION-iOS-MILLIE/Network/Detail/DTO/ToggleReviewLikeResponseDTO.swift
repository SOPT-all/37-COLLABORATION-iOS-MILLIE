//
//  ToggleReviewLikeData.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/27/25.
//


import Foundation

typealias ToggleReviewLikeResponseDTO = BaseResponseDTO<ToggleReviewLikeData>

struct ToggleReviewLikeData: Decodable {
    let reviewId: Int
    let bookId: Int
    let reviewerName: String
    let createdDate: String
    let reviewContent: String
    var likeCount: Int
    var liked: Bool
}
