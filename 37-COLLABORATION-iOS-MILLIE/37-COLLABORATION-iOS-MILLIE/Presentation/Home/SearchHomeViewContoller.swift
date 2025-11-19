
//
//  SearchHomeViewController.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 임소은 on 11/19/25.
//
import UIKit

import SnapKit
import Then

final class SearchHomeViewController: BaseUIViewController {
    
    private let homeView = SearchHomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 네비게이션 바를 숨겨서 safe area의 top이 '노치/상태바' 기준이 되도록 함
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 다른 화면으로 나갈 때는 원복(필요 시)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func setUI() {
        view.addSubviews(homeView)
    }
    
    override func setLayout() {
        homeView.snp.makeConstraints {
            // 화면 전체를 채우되
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
