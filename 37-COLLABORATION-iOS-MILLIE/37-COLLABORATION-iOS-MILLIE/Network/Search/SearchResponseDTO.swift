//
//  SearchResponseDTO.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 송성용 on 11/27/25.
//

import Foundation

typealias SearchResponseDTO = BaseResponseDTO<SearchResultDataDTO>

struct SearchResultDataDTO: Decodable {
    let keyword: String
    let bookCount: Int
    let books: [BookDataDTO]
    let banner: BannerDataDTO?
}

struct BookDataDTO: Decodable {
    let bookId: Int
    let bookCoverImageUrl: String
    let bookTitle: String
    let bookAuthor: String
    let completionRate: Int
    let completionTime: Int
    let isAudiobook: Bool
    let voiceActor: String?
}

struct BannerDataDTO: Decodable {
    let bannerId: Int
    let bannerTitle: String
    let bannerContent: String
    let bannerImageUrl: String
}

extension BookDataDTO {
    func toDomain() -> Book {
        return Book(
            bookId: bookId,
            bookCoverImageUrl: bookCoverImageUrl,
            bookTitle: bookTitle,
            bookAuthor: bookAuthor,
            completionRate: completionRate,
            completionTime: completionTime,
            isAudiobook: isAudiobook,
            voiceActor: voiceActor
        )
    }
}

extension BannerDataDTO {
    func toDomain() -> Banner {
        return Banner(
            bannerId: bannerId,
            bannerTitle: bannerTitle,
            bannerContent: bannerContent,
            bannerImageUrl: bannerImageUrl
        )
    }
}
