//
//  PostListCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 송성용 on 11/28/25.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class PostListCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let containerView = UIView()
    private let bookImageView = UIImageView()
    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    private let authorProfileImageView = UIImageView()
    private let authorNameLabel = UILabel()
    private let postDateLabel = UILabel()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setUI() {
        contentView.backgroundColor = .systemBackground
        
        containerView.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
        
        bookImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        titleLabel.do {
            $0.font = FontManager.subhead2.font
            $0.textColor = .greyBlack
            $0.numberOfLines = 1
        }
        
        contentLabel.do {
            $0.font = FontManager.caption1.font
            $0.textColor = .grey4
            $0.numberOfLines = 2
        }
        
        authorProfileImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 12
        }
        
        authorNameLabel.do {
            $0.font = FontManager.caption1.font
            $0.textColor = .darkGrey1
        }
        
        postDateLabel.do {
            $0.font = FontManager.caption4.font
            $0.textColor = .darkGrey1
        }
        
        contentView.addSubview(containerView)
        
        containerView.addSubviews(
            bookImageView,
            titleLabel,
            contentLabel,
            authorProfileImageView,
            authorNameLabel,
            postDateLabel
        )
    }
    
    private func setLayout() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bookImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(91)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(bookImageView.snp.trailing).offset(15)
            $0.top.equalToSuperview().offset(16)
        }
        
        contentLabel.snp.makeConstraints {
            $0.leading.equalTo(bookImageView.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().inset(11)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        authorProfileImageView.snp.makeConstraints {
            $0.leading.equalTo(bookImageView.snp.trailing).offset(15)
            $0.bottom.equalToSuperview().inset(17)
            $0.width.height.equalTo(25)
        }
        
        authorNameLabel.snp.makeConstraints {
            $0.leading.equalTo(authorProfileImageView.snp.trailing).offset(8)
            $0.top.equalTo(contentLabel.snp.bottom).offset(22)
        }
        
        postDateLabel.snp.makeConstraints {
            $0.leading.equalTo(authorProfileImageView.snp.trailing).offset(8)
            $0.top.equalTo(authorNameLabel.snp.bottom)
        }
    }
    
    // MARK: - Configure
    
    func configure(with post: Post) {
        titleLabel.text = post.bookTitle
        contentLabel.text = post.postContent
        authorNameLabel.text = post.authorName
        postDateLabel.text = post.postDate
        
        bookImageView.image = UIImage(named: "Img_result_book1")
        
        if post.authorProfileImageUrl.isEmpty {
            authorProfileImageView.image = nil
            authorProfileImageView.backgroundColor = .systemGray5
        } else if let url = URL(string: post.authorProfileImageUrl) {
            authorProfileImageView.kf.setImage(
                with: url,
                options: [
                    .transition(.fade(0.2)),
                    .cacheOriginalImage
                ]
            )
        }
    }
}
