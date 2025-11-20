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
}
