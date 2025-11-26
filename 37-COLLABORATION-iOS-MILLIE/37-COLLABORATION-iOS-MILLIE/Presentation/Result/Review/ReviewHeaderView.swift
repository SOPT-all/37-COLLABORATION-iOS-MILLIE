//
//  ReviewHeaderView.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/21/25.
//


import UIKit

import Then
import SnapKit

final class ReviewHeaderView: BaseUIView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel().then {
        $0.font = FontManager.subhead4.font
        $0.attributedText = "리뷰 139".changeTextColor(parts: [("리뷰", .greyBlack), ("139", .milliePurple)])
    }
    
    private let arrow = UIImageView().then {
        $0.image = .iconDetailNext
    }
    
    
    // MARK: - SetUI
    
    override func setUI() {
        addSubviews(titleLabel, arrow)
    }
    
    
    // MARK: - SetLayout
    
    override func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        
        arrow.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
    }
    
    func setReviewCount(count: Int) {
        titleLabel.attributedText = "리뷰 \(count)".changeTextColor(parts: [("리뷰", .greyBlack), ("\(count)", .milliePurple)])
    }
}
