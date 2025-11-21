//
//  UITextField+.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 10/31/25.
//

import UIKit

extension UITextField {
    func setLeftIcon(_ image: UIImage, inset: CGFloat = 12, size: CGFloat = 24, rightSpacing: CGFloat = 4.5) {
        let totalWidth = inset + size + rightSpacing
        let container = UIView(frame: CGRect(x: 0, y: 0, width: totalWidth, height: size))
        
        let iconView = UIImageView(image: image)
        iconView.contentMode = .scaleAspectFit
        iconView.frame = CGRect(x: inset, y: 0, width: size, height: size)
        
        container.addSubview(iconView)
        
        self.leftView = container
        self.leftViewMode = .always
    }
    
    func setPlaceholder(color: UIColor, font: UIFont) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color, .font: font])
        
    }
}
