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
    
    // MARK: - UI
    
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
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
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
        contentView.addSubviews(titleLabel, descriptionLabel, bookImageView)
    }
    
    private func setStyle() {
        contentView.backgroundColor = .milleWhite
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGrey1.cgColor
    }
    
    private func setLayout() {

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
            $0.trailing.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(80)
        }
    }
    
    
    
    // MARK: - Configure
    
    func configure(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }

    func setImage(_ image: UIImage) {
        bookImageView.image = image
    }
}
