//
//  DetailNavigationBarView.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김호성 on 2025.11.19.
//

import UIKit

import SnapKit
import Then

class DetailNavigationBarView: BaseUIView {
    
    // MARK: - UI Components
    let backButton = UIButton()
    let rightButtonsStackView = UIStackView()
    let likeButton = UIButton()
    let moreButton = UIButton()
    
    // MARK: - SetUI
    override func setUI() {
        backgroundColor = .clear
        addSubviews(backButton, rightButtonsStackView)
        rightButtonsStackView.addArrangedSubviews(likeButton, moreButton)
        
        backButton.do {
            $0.setImage(.iconDetailBack, for: .normal)
            $0.tintColor = .grey3
        }
        rightButtonsStackView.do {
            $0.axis = .horizontal
            $0.spacing = 6
            $0.alignment = .fill
            $0.distribution = .equalSpacing
        }
        likeButton.do {
            $0.setImage(.iconDetailHeart, for: .normal)
            $0.tintColor = .grey3
        }
        moreButton.do {
            $0.setImage(.iconDetailMore, for: .normal)
            $0.tintColor = .grey3
        }
    }
    
    // MARK: - SetLayout
    override func setLayout() {
        backButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.verticalEdges.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        rightButtonsStackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
        likeButton.snp.makeConstraints {
            $0.size.equalTo(24)
        }
        moreButton.snp.makeConstraints {
            $0.size.equalTo(24)
        }
    }
}
