
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
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func setUI() {
        view.addSubviews(homeView)
    }
    
    override func setLayout() {
        homeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
