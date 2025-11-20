//
//  DetailMillieReadingReportTableViewCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김호성 on 2025.11.20.
//

import UIKit

import SnapKit
import Then

class DetailMillieReadingReportTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    
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
        backgroundColor = .background
        contentView.addSubviews(iconImageView, titleLabel)
        iconImageView.do {
            $0.image = UIImage(resource: .iconDetailReport)
            $0.contentMode = .scaleAspectFit
        }
        titleLabel.do {
            $0.text = "밀리 독서 리포트 2023에 소개된 책"
            $0.textColor = .black
            $0.font = FontManager.subhead2.font
        }
    }
    
    // MARK: - SetLayout
    private func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.size.equalTo(20)
            $0.leading.equalToSuperview().inset(16)
            $0.verticalEdges.equalToSuperview().inset(20)
        }
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
        }
    }
}
