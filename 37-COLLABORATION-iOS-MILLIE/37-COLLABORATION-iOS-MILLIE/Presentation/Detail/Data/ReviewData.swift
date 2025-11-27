//
//  ReviewData.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/22/25.
//

import UIKit

struct ReviewData {
    var name: String
    var date: String
    var review: String
}

extension ReviewData {
    static func dummy() -> [ReviewData] {
        return [
            ReviewData(name: "어진 님", date: "2024.05.06", review: "저는 책에 오타가 난 줄 알았어요"),
            ReviewData(name: "JINBU", date: "2023.09.04", review: "이 책을 읽으려거든 아무것도 검색하지 마세요!")
        ]
    }
}
