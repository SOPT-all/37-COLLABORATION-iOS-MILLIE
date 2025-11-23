//
//  DetailBookCollectionViewCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김호성 on 2025.11.23.
//

import UIKit

import SnapKit
import Then

class DetailBookCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    let bookImageView = UIImageView()
    let bookInfoStackView = UIStackView()
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        isSelected = false
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUI
    private func setUI() {
        contentView.addSubviews(bookImageView, bookInfoStackView)
        bookInfoStackView.addArrangedSubviews(titleLabel, authorLabel)
        bookImageView.do {
            $0.contentMode = .scaleAspectFill
        }
        bookInfoStackView.do {
            $0.axis = .vertical
            $0.spacing = 2
            $0.alignment = .leading
            $0.distribution = .equalSpacing
        }
        titleLabel.do {
            $0.textColor = .black
            $0.font = FontManager.subhead4.font
        }
        authorLabel.do {
            $0.textColor = .grey3
            $0.font = FontManager.body1.font
        }
    }
    
    // MARK: - SetLayout
    private func setLayout() {
        bookImageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.width.equalTo(145)
            $0.height.equalTo(203)
        }
        bookInfoStackView.snp.makeConstraints {
            $0.top.equalTo(bookImageView.snp.bottom).offset(12)
            $0.bottom.horizontalEdges.equalToSuperview()
        }
    }
    
    func configure(relatedBook: DetailRelatedBook) {
        bookImageView.image = relatedBook.image
        titleLabel.text = relatedBook.title
        authorLabel.text = relatedBook.author
    }
}
