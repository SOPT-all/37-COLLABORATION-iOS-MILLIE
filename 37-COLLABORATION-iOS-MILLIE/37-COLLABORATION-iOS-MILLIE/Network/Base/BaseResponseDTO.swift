//
//  BaseResponseDTO.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/25/25.
//

import Foundation

struct BaseResponseDTO<T: Decodable>: Decodable {
    let code: String
    let message: String
    let data: T?
}

