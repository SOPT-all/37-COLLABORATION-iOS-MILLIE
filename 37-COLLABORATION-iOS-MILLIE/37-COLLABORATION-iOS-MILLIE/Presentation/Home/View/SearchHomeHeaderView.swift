//
//  SearchHomeHeaderView.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 임소은 on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class SearchHomeHeaderView: BaseUIView {
    
    //MARK: - UI Components
    
    private let titleLabels = UILabel().then {
        $0.text = "검색"
        $0.textColor = .black
        $0.font = FontManager.subhead3.font
    }
    
    private let profileIcon = UIImageView().then {
        $0.image = UIImage(named: "Icon_result_profile")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = .black
        $0.contentMode = .scaleAspectFit
    }
    
    //MARK: - Set UI
    
    override func setUI() {
        addSubviews(titleLabels, profileIcon)
    }
    
    //MARK: - SetLayout
    
    override func setLayout() {
        titleLabels.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(4)
        }
        
        profileIcon.snp.makeConstraints {
            $0.centerY.equalTo(titleLabels)
            $0.trailing.equalToSuperview().inset(23)
            $0.width.height.equalTo(24)
        }
    }
}

