//
//  LibraryCollectionViewCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김호성 on 2025.11.27.
//

import UIKit

import SnapKit
import Then

class LibraryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    let mainImageView = UIImageView()
    let titleLabel = UILabel()
    
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
        contentView.addSubviews(mainImageView, titleLabel)
        mainImageView.do {
            $0.image = .libraryProfile1
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 33
            $0.clipsToBounds = true
        }
        titleLabel.do {
            $0.text = "홍학의 자리 서재"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = FontManager.subbody2.font
            $0.numberOfLines = 3
            $0.lineBreakMode = .byCharWrapping
            $0.preferredMaxLayoutWidth = 66
        }
    }
    
    // MARK: - SetLayout
    private func setLayout() {
        contentView.snp.makeConstraints {
            $0.width.equalTo(66)
            $0.height.equalTo(130)
        }
        
        mainImageView.snp.makeConstraints {
            $0.size.equalTo(66)
            $0.top.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    func configure(image: UIImage, name: String) {
        mainImageView.image = image
        titleLabel.text = name
        setNeedsLayout()
        layoutIfNeeded()
    }
}
