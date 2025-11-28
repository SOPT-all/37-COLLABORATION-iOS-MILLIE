//
//  SearchResultCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 송성용 on 11/21/25.
//
import UIKit

import SnapKit
import Then
import Kingfisher


final class SearchResultCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let bookImageView = UIImageView()
    private let bookTitleLabel = UILabel()
    private let bookAuthorLabel = UILabel()
    private let readingProgressImageView = UIImageView()
    private let readingProgressLabel = UILabel()
    private let totalReadingTimeLabel = UILabel()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setUI() {
                
        contentView.do {
            $0.backgroundColor = .systemBackground
            $0.clipsToBounds = false
        }
        
        bookImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = false
            $0.layer.cornerRadius = 0
            $0.backgroundColor = .clear
        }
        
        bookTitleLabel.do {
            $0.font = FontManager.subhead3.font
            $0.textColor = .black
            $0.numberOfLines = 2
        }
        
        bookAuthorLabel.do {
            $0.font = FontManager.subbody2.font
            $0.textColor = .grey2
        }
        
        readingProgressImageView.do {
            $0.image = UIImage(named: "reading_progress_image")
            $0.contentMode = .scaleAspectFit
        }
        
        readingProgressLabel.do {
            $0.font = FontManager.body1.font
            $0.textColor = .grey2
        }
        
        totalReadingTimeLabel.do {
            $0.font = FontManager.body1.font
            $0.textColor = .grey2
        }
        
        contentView.addSubviews(
            bookImageView,
            bookTitleLabel,
            bookAuthorLabel,
            readingProgressImageView,
            readingProgressLabel,
            totalReadingTimeLabel
        )
    }
    
    private func setLayout() {
        
        bookImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(103)
            $0.height.equalTo(150)
        }
        
        bookTitleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(bookImageView.snp.bottom).offset(8)
        }
        
        bookAuthorLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(bookTitleLabel.snp.bottom).offset(2)
        }
        
        readingProgressImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(bookAuthorLabel.snp.bottom).offset(4)
            $0.size.equalTo(15)
        }
        
        readingProgressLabel.snp.makeConstraints {
            $0.leading.equalTo(readingProgressImageView.snp.trailing).offset(4)
            $0.centerY.equalTo(readingProgressImageView)
        }
        
        totalReadingTimeLabel.snp.makeConstraints {
            $0.leading.equalTo(readingProgressLabel.snp.trailing).offset(2)
            $0.centerY.equalTo(readingProgressLabel)
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    // MARK: - Configure
    
    func configure(with book: Book) {
        bookTitleLabel.text = book.bookTitle
        bookAuthorLabel.text = book.bookAuthor
        readingProgressLabel.text = "\(book.completionRate)%"
        totalReadingTimeLabel.text = "| \(book.completionTime)분"
        
        if let url = URL(string: book.bookCoverImageUrl) {
            bookImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "Img_result_book1"),
                options: [
                    .transition(.fade(0.2)),
                    .cacheOriginalImage
                ]
            )
        } else {
            print("이미지 URL 오류 - bookId: \(book.bookId), URL: \(book.bookCoverImageUrl)")
        }
        
        bookImageView.contentMode = .scaleAspectFill
    }
}
