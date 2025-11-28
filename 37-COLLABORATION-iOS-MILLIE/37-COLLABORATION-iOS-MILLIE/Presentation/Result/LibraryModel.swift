//
//  LibraryModel.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by AI Assistant
//

import UIKit

struct Library {
    let id: Int
    let profileImage: UIImage
    let name: String
}

extension Library {
    static let mockLibraries: [Library] = [
        Library(id: 1, profileImage: UIImage(named: "library_img1") ?? UIImage(), name: "홍학의 자리 서재"),
        Library(id: 2, profileImage: UIImage(named: "library_img2") ?? UIImage(named: "library_img1") ?? UIImage(), name: "홍학의 자리 예반하다 서재"),
        Library(id: 3, profileImage: UIImage(named: "library_img3") ?? UIImage(named: "library_img1") ?? UIImage(), name: "홍학의 자리 예반하다 서재"),
        Library(id: 4, profileImage: UIImage(named: "library_img4") ?? UIImage(named: "library_img1") ?? UIImage(), name: "홍학의 자리 서재")
    ]
}



