//
//  DetailService.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/27/25.
//


protocol DetailServiceProtocol {
    func getBookDetailInfo(bookId: Int) async -> Result<BookDetailInfoResponseDTO, NetworkError>
}

final class DetailService: BaseService, DetailServiceProtocol {
    func getBookDetailInfo(bookId: Int) async -> Result<BookDetailInfoResponseDTO, NetworkError> {
        return await requestDecodable(target: DetailAPI.getBookDetailInfo(bookId: bookId))
    }
}
