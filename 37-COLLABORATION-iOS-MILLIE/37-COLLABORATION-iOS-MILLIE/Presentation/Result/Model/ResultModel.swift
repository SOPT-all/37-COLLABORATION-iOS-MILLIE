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
