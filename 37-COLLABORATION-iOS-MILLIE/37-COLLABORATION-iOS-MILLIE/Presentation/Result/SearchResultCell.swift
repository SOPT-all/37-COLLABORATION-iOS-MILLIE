//
//  SearchResultCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 송성용 on 11/21/25.
//
import UIKit

import SnapKit
import Then


class SearchResultCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let bookImageView = UIImageView()
    private let bookTitleLabel = UILabel()
    private let bookAuthorLabel = UILabel()
    private let readingProgressLabel = UILabel()
    private let totalReadingTimeLabel = UILabel()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setStyle() {
                
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
        
        readingProgressLabel.do {
            $0.font = FontManager.body1.font
            $0.textColor = .grey2
        }
        
        totalReadingTimeLabel.do {
            $0.font = FontManager.caption3.font
            $0.textColor = .grey2
        }
    }
    
    private func setUI() {
        contentView.addSubviews(
            bookImageView,
            bookTitleLabel,
            bookAuthorLabel,
            readingProgressLabel,
            totalReadingTimeLabel
        )
    }
    
    private func setLayout() {
        
        bookImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(10)
            $0.width.equalTo(103)
            $0.height.equalTo(150)
        }
        
        bookTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(5.5)
            $0.top.equalTo(bookImageView.snp.bottom).offset(10)
        }
        
        bookAuthorLabel.snp.makeConstraints {
            $0.leading.equalTo(bookTitleLabel)
            $0.top.equalTo(bookTitleLabel.snp.bottom)
        }
        
        readingProgressLabel.snp.makeConstraints {
            $0.leading.equalTo(bookTitleLabel)
            $0.top.equalTo(bookAuthorLabel.snp.bottom).offset(1)
        }
        
        totalReadingTimeLabel.snp.makeConstraints {
            $0.leading.equalTo(readingProgressLabel.snp.trailing).offset(2)
            $0.top.equalTo(bookAuthorLabel.snp.bottom).offset(1)
        }
    }
    
    // MARK: - Configure
    
    func configure(with book: Book) {
        bookTitleLabel.text = book.bookTitle
        bookAuthorLabel.text = book.bookAuthor
        readingProgressLabel.text = "\(book.completionRate)%"
        totalReadingTimeLabel.text = "| \(book.completionTime)분"
        
        bookImageView.image = UIImage(named: "Img_result_book1")
        bookImageView.contentMode = .scaleAspectFill
    }
}

#Preview {
    SearchResultCell()
}
