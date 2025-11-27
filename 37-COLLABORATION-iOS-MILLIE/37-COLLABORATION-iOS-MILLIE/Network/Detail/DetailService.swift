//
//  DetailService.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/27/25.
//


protocol DetailServiceProtocol {
    func toggleReviewLike(reviewId: Int) async -> Result<ToggleReviewLikeResponseDTO, NetworkError>
}

final class DetailService: BaseService, DetailServiceProtocol {
    func toggleReviewLike(reviewId: Int) async -> Result<ToggleReviewLikeResponseDTO, NetworkError> {
        return await requestDecodable(target: DetailAPI.toggleReviewLike(reviewId: reviewId))
    }
}
