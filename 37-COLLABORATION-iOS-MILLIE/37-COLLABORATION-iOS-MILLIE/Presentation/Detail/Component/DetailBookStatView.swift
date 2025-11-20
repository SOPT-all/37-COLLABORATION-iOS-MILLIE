//
//  DetailBookStatView.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김호성 on 2025.11.20.
//

import UIKit

import SnapKit
import Then

class DetailBookStatView: BaseUIView {
    
    enum BookStatType {
        case reviewCount(Int)
        case rate(Float)
        case completeRate(Int)
    }
    
    // MARK: - UI Components
    let mainStackView = UIStackView()
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    
    // MARK: - SetUI
    override func setUI() {
        backgroundColor = .clear
        addSubviews(mainStackView)
        mainStackView.addArrangedSubviews(iconImageView, titleLabel)
        
        mainStackView.do {
            $0.axis = .vertical
            $0.spacing = 10
            $0.alignment = .center
            $0.distribution = .equalSpacing
        }
        iconImageView.do {
            $0.contentMode = .scaleAspectFit
        }
        titleLabel.do {
            $0.textColor = .black
        }
    }
    
    // MARK: - SetLayout
    override func setLayout() {
        mainStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        iconImageView.snp.makeConstraints {
            $0.size.equalTo(24)
        }
    }
    
    func configure(bookStatType: BookStatType) {
        let title: String
        let highlighted: String
        switch bookStatType {
        case .reviewCount(let reviewCount):
            iconImageView.image = UIImage(resource: .iconDetailReview)
            highlighted = "\(reviewCount)건"
            title = "리뷰 \(highlighted)"
        case .rate(let rate):
            iconImageView.image = UIImage(resource: .iconDetailStarEmpty)
            highlighted = String(format: "%.1f", rate)
            title = "평점 \(highlighted)"
        case .completeRate(let completeRate):
            iconImageView.image = UIImage(resource: .iconDetailBookOpen)
            highlighted = "\(completeRate)%"
            title = "완독률 \(highlighted)"
        }
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: [
            .font: FontManager.body1.font
        ])
        if let range = title.range(of: highlighted) {
            let nsRange = NSRange(range, in: title)
            attributedTitle.addAttributes([
                .font: FontManager.subhead2.font
            ], range: nsRange)
        }
        
        titleLabel.attributedText = attributedTitle
    }
}

#Preview {
    DetailBookStatView().then({
        $0.configure(bookStatType: .completeRate(139))
    })
}
