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
    
    //TODO: - 검색바 넣기
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let realTimeRank = RealTimeRankHeaderView()
    
    private let shortcutSection = ShortcutSectionView()
    
    //TODO: - 카테고리... 바 넣기
    
    private let categoryLabel = UILabel().then {
        $0.text = "카테고리"
        $0.textColor = .black
        $0.font = FontManager.headline.font
    }
    
    private let bookCategoryView = BookCategoryView()
    
    //MARK:  - Set UI
    
    override func setUI() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            headerView,
            realTimeRank,
            shortcutSection,
            categoryLabel,
            bookCategoryView
        )
    }
    //MARK:  - Set Layout
    override func setLayout() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.snp.edges)
            $0.width.equalTo(scrollView.snp.width)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        realTimeRank.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(58)   //TODO: - 검색바 들어오면 수정
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        shortcutSection.snp.makeConstraints {
            $0.top.equalTo(realTimeRank.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(94)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(shortcutSection.snp.bottom).offset(22) //TODO: - 들어오면 수정
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

#Preview {
    SearchHomeView()
}
