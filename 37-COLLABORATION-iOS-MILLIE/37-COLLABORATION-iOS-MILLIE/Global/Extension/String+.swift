//
//  String+.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/21/25.
//

import UIKit

extension String {
    func getTextContentSize(withFont font: UIFont) -> CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: attributes)
        return size
    }
    
    func changeTextColor(parts: [(String, UIColor)]) -> NSAttributedString {
        let attr = NSMutableAttributedString(string: self)

        for (text, color) in parts {
            let range = (self as NSString).range(of: text)
            if range.location != NSNotFound {
                attr.addAttribute(.foregroundColor, value: color, range: range)
            }
        }
        return attr
    }
    
    func getTextHeight(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(
            with: constraintRect,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: [.font: font],
            context: nil
        )
        return ceil(boundingBox.height)
    }
}
