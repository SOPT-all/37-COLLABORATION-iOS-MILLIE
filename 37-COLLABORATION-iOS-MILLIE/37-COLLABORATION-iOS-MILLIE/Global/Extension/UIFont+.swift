//
//  UIFont+.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 10/29/25.
//

import UIKit

public extension UIFont {
    enum FontType: String {
        case bold = "NotoSansKR-Bold"
        case regular = "NotoSansKR-Regular"
        
        var name: String {
            return self.rawValue
        }
        
        static func font(_ type: FontType, ofsize size: CGFloat) -> UIFont {
            if let font = UIFont(name: type.rawValue, size: size) {
                return font
            }
            else {
                fatalError("font not found")
            }
        }
    }
}

