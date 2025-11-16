//
//  FontManager.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/16/25.
//

import UIKit

public struct FontProperty {
    let font: UIFont.FontType
    let size: CGFloat
    let lineHeight: CGFloat
    let kern: CGFloat
}

public enum FontManager {
    case headline
    
    case subhead1
    case subhead2
    case subhead3
    case subhead4
    case subhead5
    
    case body1
    case body2
    case body3
    
    case subbody1
    case subbody2
    
    case caption1
    case caption2
    case caption3
    case caption4
    
    public var fontProperty: FontProperty {
        switch self {
        case .headline:
            return FontProperty(font: .bold, size: 20, lineHeight: 28, kern: -1)
        case .subhead1:
            return FontProperty(font: .bold, size: 12, lineHeight: 16, kern: -0.6)
        case .subhead2:
            return FontProperty(font: .bold, size: 14, lineHeight: 20, kern: -0.6)
        case .subhead3:
            return FontProperty(font: .bold, size: 15, lineHeight: 20, kern: -0.6)
        case .subhead4:
            return FontProperty(font: .bold, size: 16, lineHeight: 22, kern: -0.6)
        case .subhead5:
            return FontProperty(font: .bold, size: 18, lineHeight: 28, kern: -1)
        case .body1:
            return FontProperty(font: .regular, size: 14, lineHeight: 22, kern: -0.6)
        case .body2:
            return FontProperty(font: .regular, size: 15, lineHeight: 20, kern: -0.6)
        case .body3:
            return FontProperty(font: .regular, size: 16, lineHeight: 24, kern: -0.6)
        case .subbody1:
            return FontProperty(font: .regular, size: 11, lineHeight: 18, kern: 0)
        case .subbody2:
            return FontProperty(font: .regular, size: 13, lineHeight: 18, kern: -0.6)
        case .caption1:
            return FontProperty(font: .regular, size: 9, lineHeight: 14, kern: -0.6)
        case .caption2:
            return FontProperty(font: .regular, size: 10, lineHeight: 18, kern: -0.6)
        case .caption3:
            return FontProperty(font: .regular, size: 12, lineHeight: 18, kern: -0.6)
        case .caption4:
            return FontProperty(font: .regular, size: 8, lineHeight: 10, kern: -0.6)
        }
    }
}

public extension FontManager {
    var font: UIFont {
        guard let font = UIFont(name: fontProperty.font.name, size: fontProperty.size) else {
            return UIFont()
        }
        return font
    }
}
