//
//  PostModel.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 송성용 on 11/28/25.
//

import Foundation

// MARK: - Post

struct Post {
    let postId: Int
    let bookTitle: String
    let postContent: String
    let authorName: String
    let authorProfileImageUrl: String
    let postDate: String
}

// MARK: - Mock Data

extension Post {
    static let mockPosts: [Post] = [
        Post(
            postId: 1,
            bookTitle: "홍학의 자리",
            postContent: "독서를 취미로 삼고자 좋아하는 이□□교 유림을 얻으셨다고 내가 거기 가보니 설산에 작가는 3부에서 작가로 가야되는 게...",
            authorName: "뇌색깔의 서재",
            authorProfileImageUrl: "",
            postDate: "2024.02.05"
        ),
        Post(
            postId: 2,
            bookTitle: "[책리뷰]홍학의 자리(정혜연)",
            postContent: "#책리뷰 #홍학의자리 #2정혜연 #책릴레이서천은 부끄러움양의 죄들이 비달하진 한 평생의 가치로 보너스 할…",
            authorName: "북랜드 Bookland의 서재",
            authorProfileImageUrl: "",
            postDate: "2024.07.03"
        ),
        Post(
            postId: 3,
            bookTitle: "홍학의 자리",
            postContent: "양배란 작가님 홍학의 자리는 단순한 빛과 수결한 수있을거다나야인간 리미어에 심급에게 받여지는 작…",
            authorName: "수영이 옛날 인류_487006의 서재",
            authorProfileImageUrl: "",
            postDate: "2025.04.21"
        ),
        Post(
            postId: 4,
            bookTitle: "홍학의 자리",
            postContent: "오무엇나, 홍학의자리를 얻으셨다고 알긴 네가 거치 돌아하는 작가는 3부에서 작가로 가야되는 게 세가 그이고 어니다. 다들…",
            authorName: "감부대묘의 서재",
            authorProfileImageUrl: "",
            postDate: "2024.08.30"
        )
    ]
}
