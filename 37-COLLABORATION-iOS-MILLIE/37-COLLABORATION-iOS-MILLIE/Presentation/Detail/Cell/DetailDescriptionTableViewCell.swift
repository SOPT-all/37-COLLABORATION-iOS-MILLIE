//
//  DetailDescriptionTableViewCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김호성 on 2025.11.20.
//

import UIKit

import SnapKit
import Then

class DetailDescriptionTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let moreButton = UIButton()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        moreButton.isHidden = descriptionLabel.fullNumberOfLines <= 3 || !moreButton.isEnabled
    }
    
    // MARK: - SetUI
    private func setUI() {
        backgroundColor = .background
        contentView.addSubviews(titleLabel, descriptionLabel, moreButton)
        titleLabel.do {
            $0.text = "책 소개"
            $0.textColor = .black
            $0.font = FontManager.subhead4.font
        }
        descriptionLabel.do {
            $0.textColor = .darkGrey1
            $0.font = FontManager.body1.font
            $0.numberOfLines = 3
        }
        moreButton.do {
            $0.isHidden = true
            $0.setTitle("더보기", for: .normal)
            $0.titleLabel?.font = FontManager.body1.font
            $0.setTitleColor(.milliePurple, for: .normal)
            $0.addTarget(self, action: #selector(touchUpInsideMoreButton), for: .touchUpInside)
        }
    }
    // MARK: - SetLayout
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.equalToSuperview().inset(16)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        moreButton.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(30)
        }
    }
    
    @objc private func touchUpInsideMoreButton(_ sender: UIButton) {
        sender.isEnabled = false
        sender.isHidden = true
        descriptionLabel.numberOfLines = 0
    }
    
    func configure(bookDetailModel: BookDetailModel) {
        descriptionLabel.text = bookDetailModel.bookDescription
        moreButton.isHidden = descriptionLabel.fullNumberOfLines <= 3 || !moreButton.isEnabled
    }
}
