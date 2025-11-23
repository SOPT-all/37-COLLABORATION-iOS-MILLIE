//
//  ResultModel.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 송성용 on 11/21/25.
//

import Foundation

// MARK: - Response Wrapper

struct SearchResultResponse {
    let code: String
    let message: String
    let data: SearchResultData
}

// MARK: - Search Result Data

struct SearchResultData {
    let keyword: String
    let bookCount: Int
    let books: [Book]
    let banner: Banner?
}

// MARK: - Book

struct Book {
    let bookId: Int
    let bookCoverImageUrl: String
    let bookTitle: String
    let bookAuthor: String
    let completionRate: Int
    let completionTime: Int
    let isAudiobook: Bool
    let voiceActor: String?
}

// MARK: - Banner

struct Banner {
    let bannerId: Int
    let bannerTitle: String
    let bannerContent: String
    let bannerImageUrl: String
}

// MARK: - Mock Data

extension SearchResultResponse {
    static let mockData = SearchResultResponse(
        code: "B201",
        message: "도서 검색 조회 성공",
        data: SearchResultData(
            keyword: "홍학",
            bookCount: 2,
            books: [
                Book(
                    bookId: 1,
                    bookCoverImageUrl: "",
                    bookTitle: "홍학의 자리",
                    bookAuthor: "정해연",
                    completionRate: 80,
                    completionTime: 247,
                    isAudiobook: false,
                    voiceActor: nil
                ),
                Book(
                    bookId: 2,
                    bookCoverImageUrl: "",
                    bookTitle: "홍학의 자리",
                    bookAuthor: "정해연",
                    completionRate: 80,
                    completionTime: 247,
                    isAudiobook: true,
                    voiceActor: "임은지"
                )
            ],
            banner: Banner(
                bannerId: 1,
                bannerTitle: "《홍학의 자리》 읽을 준비!",
                bannerContent: "이 책부터 읽어야 재미가 2배",
                bannerImageUrl: ""
            )
        )
    )
}
