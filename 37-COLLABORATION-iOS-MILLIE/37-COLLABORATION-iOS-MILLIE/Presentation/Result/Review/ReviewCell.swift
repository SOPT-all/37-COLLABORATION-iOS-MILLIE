//
//  ReviewCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/21/25.
//

import UIKit

import Then
import SnapKit

final class ReviewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let nameLabel = UILabel()
    private let userImage = UIImageView()
    private let dateLabel = UILabel()
    private let reviewLabel = UILabel()
    private let menuButton = UIImageView()
    private let likeButton = LikeButton()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - SetUI
    
    private func setUI() {
        nameLabel.do {
            $0.textColor = .greyBlack
            $0.font = FontManager.body1.font
        }
        
        userImage.do {
            $0.image = .reviewProfile
        }
        
        dateLabel.do {
            $0.textColor = .grey2
            $0.font = FontManager.caption3.font
        }
        
        reviewLabel.do {
            $0.textColor = .greyBlack
            $0.font = FontManager.body1.font
        }
        
        menuButton.do {
            $0.image = .iconDetailMore
        }
        
        contentView.addSubviews(nameLabel, userImage, dateLabel, reviewLabel, menuButton, likeButton)
    }
    
    
    // MARK: - SetLayout
    
    private func setLayout() {
        userImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.size.equalTo(24)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(userImage.snp.trailing).offset(10)
            $0.centerY.equalTo(userImage)
        }
        
        menuButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.size.equalTo(24)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(userImage.snp.bottom).offset(10)
        }
        
        reviewLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(dateLabel.snp.bottom).offset(10)
        }
        
        likeButton.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.top.equalTo(reviewLabel.snp.bottom).offset(10)
        }
    }
}

extension ReviewCell {
    func dataBind(data: ToggleReviewLikeData) {
        nameLabel.text = data.reviewerName
        dateLabel.text = data.createdDate
        reviewLabel.text = data.reviewContent
        likeButton.setLikeCount(data.likeCount)
    }
}
