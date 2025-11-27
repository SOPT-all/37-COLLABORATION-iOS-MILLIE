//
//  DetailPrimaryInfoTableViewCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김호성 on 2025.11.19.
//

import UIKit

import Kingfisher
import SnapKit
import Then

class DetailPrimaryInfoTableViewCell: UITableViewCell {
    
    var updateBackgroundColor: ((UIColor?) -> Void)?
    
    // MARK: - UI Components
    let bookImageView = UIImageView()
    let bookShadow1View = UIView()
    let bookShadow2View = UIView()
    let bookShadow3View = UIView()
    
    let bookPrimaryInfoView = UIView()
    
    let bookInfoStackView = UIStackView()
    let bookTitleLabel = UILabel()
    let bookSubtitleLabel = UILabel()
    
    let bookStatsStackView = UIStackView()
    let bookReviewStatView = DetailBookStatView()
    let separatorView1 = UIView()
    let bookRateStatView = DetailBookStatView()
    let separatorView2 = UIView()
    let bookCompleteRateStatView = DetailBookStatView()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUI
    private func setUI() {
        backgroundColor = .clear
        contentView.addSubviews(bookShadow1View, bookShadow2View, bookShadow3View, bookImageView, bookPrimaryInfoView)
        bookPrimaryInfoView.addSubviews(bookInfoStackView, bookStatsStackView)
        bookInfoStackView.addArrangedSubviews(bookTitleLabel, bookSubtitleLabel)
        bookStatsStackView.addArrangedSubviews(UIView(), bookReviewStatView, separatorView1, bookRateStatView, separatorView2, bookCompleteRateStatView, UIView())
        bookImageView.do {
            $0.layer.cornerRadius = 8
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        bookShadow1View.do {
            $0.backgroundColor = .background
            $0.clipsToBounds = false
            $0.layer.cornerRadius = bookImageView.layer.cornerRadius
            $0.layer.applyShadow(alpha: 0.24, blur: 2, spread: 0)
        }
        bookShadow2View.do {
            $0.backgroundColor = .background
            $0.clipsToBounds = false
            $0.layer.cornerRadius = bookImageView.layer.cornerRadius
            $0.layer.applyShadow(alpha: 0.2, blur: 24, spread: 0, x: 12, y: 8)
        }
        bookShadow3View.do {
            $0.backgroundColor = .background
            $0.clipsToBounds = false
            $0.layer.cornerRadius = bookImageView.layer.cornerRadius
            $0.layer.applyShadow(alpha: 0.1, blur: 8, spread: 0, x: 4, y: 8)
        }
        bookPrimaryInfoView.do {
            $0.backgroundColor = .background
            $0.layer.cornerRadius = 28
            $0.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
            $0.layer.applyShadow(alpha: 0.1, blur: 20, spread: 0, y: -5)
        }
        bookInfoStackView.do {
            $0.axis = .vertical
            $0.spacing = 0
            $0.alignment = .leading
            $0.distribution = .equalSpacing
        }
        bookTitleLabel.do {
            $0.textColor = .black
            $0.font = FontManager.headline.font
        }
        bookSubtitleLabel.do {
            $0.textColor = .grey3
            $0.font = FontManager.body1.font
        }
        bookStatsStackView.do {
            $0.axis = .horizontal
            $0.spacing = 15
            $0.alignment = .center
            $0.distribution = .equalSpacing
        }
        separatorView1.do {
            $0.backgroundColor = .grey2
        }
        separatorView2.do {
            $0.backgroundColor = .grey2
        }
    }
    
    // MARK: - SetLayout
    private func setLayout() {
        bookImageView.snp.makeConstraints {
            $0.width.equalTo(193)
            $0.height.equalTo(280)
            $0.top.equalToSuperview().inset(133)
            $0.centerX.equalToSuperview()
        }
        bookShadow1View.snp.makeConstraints {
            $0.edges.equalTo(bookImageView)
        }
        bookShadow2View.snp.makeConstraints {
            $0.edges.equalTo(bookImageView)
        }
        bookShadow3View.snp.makeConstraints {
            $0.edges.equalTo(bookImageView)
        }
        bookPrimaryInfoView.snp.makeConstraints {
            $0.top.equalTo(bookImageView.snp.bottom).offset(46)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        bookInfoStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(40)
        }
        bookStatsStackView.snp.makeConstraints {
            $0.top.equalTo(bookInfoStackView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(10)
            $0.height.equalTo(97)
        }
        separatorView1.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(55)
        }
        separatorView2.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(55)
        }
    }
    
    func configure(bookDetailInfoData: BookDetailInfoData) {
        bookImageView.kf.setImage(with: bookDetailInfoData.bookCoverImageUrl) { [weak self] result in
            if case let .success(image) = result {
                self?.updateBackgroundColor?(image.image.averageColor)
            }
        }
        bookTitleLabel.text = bookDetailInfoData.bookTitle
        bookSubtitleLabel.text = "\(bookDetailInfoData.bookAuthor) \(bookDetailInfoData.bookType) · \(bookDetailInfoData.publishedDate)"
        bookReviewStatView.configure(bookStatType: .reviewCount(bookDetailInfoData.totalReviewCount))
        bookRateStatView.configure(bookStatType: .rate(bookDetailInfoData.bookRate))
        bookCompleteRateStatView.configure(bookStatType: .completeRate(bookDetailInfoData.completionRate))
    }
}
