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
    
    //MARK:  - Set UI
    
    override func setUI() {
        addSubview(headerView)
    }
    
    override func setLayout() {
        headerView.snp.makeConstraints {
            // 자신의 safe area top에 붙여서 노치/상태바를 침범하지 않게 함
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
    }
}

#Preview {
    SearchHomeView()
}
