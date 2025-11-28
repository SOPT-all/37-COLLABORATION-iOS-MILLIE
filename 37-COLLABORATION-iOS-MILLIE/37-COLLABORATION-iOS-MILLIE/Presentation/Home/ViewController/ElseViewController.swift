//
//  ElseViewController.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/16/25.
//

import UIKit

class ElseViewController: UIViewController {

    private let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setUI()
        setLayout()
        updateTitleFromTab()
    }

    private func setUI() {
        titleLabel.font = FontManager.body1.font
        titleLabel.textColor = .greyBlack
        view.addSubview(titleLabel)
    }

    private func setLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func updateTitleFromTab() {
        if let tabTitle = self.navigationController?.tabBarItem.title {
            titleLabel.text = tabTitle
        }
    }
}


