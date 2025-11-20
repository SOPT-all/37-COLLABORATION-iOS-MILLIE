//
//  UILabel+.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김호성 on 2025.11.20.
//

import UIKit

extension UILabel {
    var fullNumberOfLines: Int {
        let text = (text ?? "") as NSString
        let labelTextSize = text.boundingRect(
            with: CGSize(width: bounds.width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [.font: font as Any],
            context: nil
        )
        return Int(ceil(labelTextSize.height / font.lineHeight))
    }
}
