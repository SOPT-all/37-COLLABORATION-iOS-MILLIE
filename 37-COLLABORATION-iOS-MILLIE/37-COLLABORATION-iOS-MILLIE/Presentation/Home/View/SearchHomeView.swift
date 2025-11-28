//
//  SearchHomeView.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 임소은 on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class SearchHomeView: BaseUIView {
    
    //MARK: - UI Components
    
    private let headerView = SearchHomeHeaderView()
    
    private let millieSearchTextField = MillieSearchTextField()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let realTimeRank = RealTimeRankHeaderView()
    
    private let shortcutSection = ShortcutSectionView()
    
    let categoryTabs = MillieCategoryTabs().then {
        $0.size = .big
    }
    
    private let categoryLabel = UILabel().then {
        $0.text = "카테고리"
        $0.textColor = .black
        $0.font = FontManager.headline.font
    }
    
    let bookCategoryView = BookCategoryView()
    
    //MARK:  - Set UI
    
    override func setUI() {
        addSubviews(
            headerView,
            millieSearchTextField,
            realTimeRank,
            shortcutSection,
            categoryTabs,
            scrollView
        )
        
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            categoryLabel,
            bookCategoryView
        )
    }
    
    
    //MARK:  - Set Layout
    
    override func setLayout() {
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        millieSearchTextField.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(45)
        }
        
        realTimeRank.snp.makeConstraints {
            $0.top.equalTo(millieSearchTextField.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        shortcutSection.snp.makeConstraints {
            $0.top.equalTo(realTimeRank.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(94)
        }
        
        categoryTabs.snp.makeConstraints {
            $0.top.equalTo(shortcutSection.snp.bottom).offset(29)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(categoryTabs.snp.bottom).offset(0)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(17)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(28)
        }
        
        bookCategoryView.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.bottom.equalToSuperview().inset(24)
        }
    }
}

extension SearchHomeView {
    func getTextField() -> MillieSearchTextField {
        return millieSearchTextField
    }
}
