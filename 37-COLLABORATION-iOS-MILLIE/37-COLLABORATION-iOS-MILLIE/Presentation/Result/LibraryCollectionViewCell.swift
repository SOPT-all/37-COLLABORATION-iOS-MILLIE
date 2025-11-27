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
            $0.contentMode = .scaleAspectFit
            $0.layer.cornerRadius = 33
        }
        titleLabel.do {
            $0.text = "홍학의 자리 서재"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = FontManager.subbody2.font
            $0.numberOfLines = 0
        }
    }
    
    // MARK: - SetLayout
    private func setLayout() {
        mainImageView.snp.makeConstraints {
            $0.size.equalTo(66)
            $0.top.horizontalEdges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom).offset(7)
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
    }
}
