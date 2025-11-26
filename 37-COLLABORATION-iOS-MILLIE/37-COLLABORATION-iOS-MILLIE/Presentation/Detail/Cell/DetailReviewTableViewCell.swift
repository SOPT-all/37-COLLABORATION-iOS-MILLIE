//
//  DetailReviewTableViewCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김호성 on 2025.11.25.
//

import UIKit

import SnapKit
import Then

class DetailReviewTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    let reviewView = ReviewView()
    
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
        contentView.addSubview(reviewView)
    }
    
    // MARK: - SetLayout
    private func setLayout() {
        reviewView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
