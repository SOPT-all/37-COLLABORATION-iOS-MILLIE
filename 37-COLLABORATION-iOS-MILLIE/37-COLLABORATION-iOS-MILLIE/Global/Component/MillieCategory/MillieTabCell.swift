//
//  MillieTabCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/20/25.
//

import UIKit

import Then
import SnapKit

final class MillieTabCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            updateFont()
        }
    }
    
    // MARK: - SetUI
    
    private func setUI() {
        titleLabel.do {
            $0.textColor = .greyBlack
            $0.font = FontManager.body3.font
        }
        contentView.addSubviews(titleLabel)
    }
    
    
    // MARK: - SetLayout
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

extension MillieTabCell {
    func getTitleWidth() -> CGFloat {
        return self.titleLabel.frame.width
    }
    
    func configure(text: String) {
        titleLabel.text = text
    }
    
    private func updateFont() {
        if isSelected {
            titleLabel.font = FontManager.subhead4.font
        } else {
            titleLabel.font = FontManager.body3.font
        }
    }
}
