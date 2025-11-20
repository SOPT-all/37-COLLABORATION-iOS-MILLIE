//
//  ShortcutCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 임소은 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class ShortcutCell: UICollectionViewCell {
    
    //MARK: - UI Components
    
    private let iconBackground = UIView().then {
        $0.backgroundColor = .lightGrey1
        $0.layer.cornerRadius = 19
        $0.clipsToBounds = true
    }
    
    private let iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .grey2
    }
    
    private let titleLabel = UILabel().then {
        $0.font = FontManager.body2.font
        $0.textColor =  .black
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set UI
    
    private func setUI() {
        contentView.addSubviews(iconBackground, titleLabel)
        iconBackground.addSubview(iconImageView)
    }
    
    //MARK: - Set Layout
    private func setLayout() {
        
        iconBackground.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(38)
        }
        
        iconImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(iconBackground.snp.trailing).offset(16)
            $0.centerY.equalTo(iconBackground.snp.centerY)
            $0.trailing.lessThanOrEqualToSuperview()
        }
    }
    
    //MARK: - Configure
    
    func configure(icon: UIImage?, title: String) {
        iconImageView.image = icon?.withRenderingMode(.alwaysTemplate)
        titleLabel.text = title
    }
    
}
