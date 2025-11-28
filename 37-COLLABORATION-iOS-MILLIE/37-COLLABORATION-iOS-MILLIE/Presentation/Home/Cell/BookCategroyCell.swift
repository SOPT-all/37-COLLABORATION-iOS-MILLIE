//
//  BookCategoryCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 임소은 on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class BookCategoryCell: UICollectionViewCell {
    
    static let reuseIdentifier = "BookCategoryCell"
    
    // MARK: - UI
    
    private let containerView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = FontManager.subhead4.font
    }
    
    private let descriptionLabel = UILabel().then {
        $0.textColor = .grey2
        $0.font = FontManager.subbody1.font
        $0.numberOfLines = 1
    }
    
    private let bookImageView = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
    }
    
    private let recentBadgeLabel = UILabel().then {
        $0.text = "최근열어본"
        $0.font = FontManager.caption4.font
        $0.textAlignment = .center
        $0.textColor = .black
        $0.backgroundColor = UIColor(named: "millie_Yellow")
        $0.isHidden = true
        $0.layer.masksToBounds = true
    }
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI Setup
    
    private func setUI() {
        contentView.addSubview(containerView)
        containerView.addSubviews(titleLabel, descriptionLabel, bookImageView, recentBadgeLabel)
    }
    private func setStyle() {
        contentView.backgroundColor = .milleWhite
        contentView.layer.cornerRadius = 0
        contentView.layer.masksToBounds = false
    }

    
    private func setLayout() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.lessThanOrEqualTo(bookImageView.snp.leading).offset(-8)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.equalTo(titleLabel)
            $0.trailing.lessThanOrEqualTo(bookImageView.snp.leading).offset(-8)
        }
        
        bookImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalToSuperview()
        }
        
        recentBadgeLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(19)
            $0.width.equalTo(48)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        recentBadgeLabel.layer.cornerRadius = 4
        recentBadgeLabel.layer.maskedCorners = [.layerMinXMinYCorner]
    }
    
    // MARK: - Configure
    
    func configure(with model: BookCategoryModel, isRecent: Bool) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        bookImageView.image = UIImage(named: model.imageURL)
        
        containerView.layer.borderWidth = 1
        
        if isRecent {
            containerView.layer.borderColor = UIColor(named: "millie_Yellow")?.cgColor
            recentBadgeLabel.isHidden = false
        } else {
            containerView.layer.borderColor = UIColor.lightGrey1.cgColor
            recentBadgeLabel.isHidden = true
        }
    }
    
    func setImage(_ image: UIImage) {
        bookImageView.image = image
    }
}
