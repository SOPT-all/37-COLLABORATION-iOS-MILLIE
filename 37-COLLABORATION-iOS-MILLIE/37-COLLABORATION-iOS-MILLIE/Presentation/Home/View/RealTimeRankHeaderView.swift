//
//  RealTimeRankHeaderView.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 임소은 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class RealTimeRankHeaderView: BaseUIView {
    
    //MARK: - UI Components
    
    private let rankLabel = UILabel().then {
        $0.text = "2"
        $0.textColor = .black
        $0.font = FontManager.subhead1.font
    }
    
    private let categoryLabel = UILabel().then {
        $0.text = "동화"
        $0.textColor = .black
        $0.font = FontManager.body3.font
    }
    
    private let upIcon = UIImageView().then {
        $0.image = UIImage(named: "icon_up")
        $0.contentMode = .scaleAspectFit
    }
    
    private let dropDownIcon = UIImageView().then {
        $0.image = UIImage(named: "Icon_result_ranking")
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .grey3
    }
    
    private lazy var leftStack = UIStackView(arrangedSubviews: [rankLabel, categoryLabel, upIcon]).then {
        $0.axis = .horizontal
        $0.spacing = 7
        $0.alignment = .center
    }
    
    //MARK: - Set Layout
    
    override func setUI() {
        addSubviews(leftStack, dropDownIcon)
    }
    
    //MARK: - Set Layout
    
    override func setLayout() {
        leftStack.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(23)
            $0.centerY.equalToSuperview()
        }
        
        dropDownIcon.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(23)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        upIcon.snp.makeConstraints {
            $0.width.height.equalTo(10)
        }
    }
    
    
}
