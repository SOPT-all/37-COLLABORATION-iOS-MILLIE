//
//  DetailBottomBarView.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김호성 on 2025.11.19.
//

import UIKit

import SnapKit
import Then

class DetailBottomBarView: BaseUIView {
    
    // MARK: - UI Components
    let separatorView = UIView()
    let storeButton = UIButton()
    let downloadButton = UIButton()
    let readButton = UIButton()
    
    // MARK: - SetUI
    override func setUI() {
        backgroundColor = .background
        addSubviews(separatorView, storeButton, downloadButton, readButton)
        
        separatorView.do {
            $0.backgroundColor = .lightGrey2
        }
        storeButton.do {
            var configuration = UIButton.Configuration.plain()
            
            configuration.attributedTitle = AttributedString("담기", attributes: AttributeContainer([
                .font: FontManager.caption2.font,
            ]))
            configuration.image = .iconDetailStore
            configuration.imagePlacement = .top
            configuration.imagePadding = 0
            configuration.titleAlignment = .center
            configuration.contentInsets = .zero
            configuration.background.cornerRadius = 0
            configuration.cornerStyle = .fixed
            
            $0.configuration = configuration
            $0.tintColor = .grey3
            $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        downloadButton.do {
            var configuration = UIButton.Configuration.plain()
            
            configuration.attributedTitle = AttributedString("다운로드", attributes: AttributeContainer([
                .font: FontManager.caption2.font,
            ]))
            configuration.image = .iconDetailDownload
            configuration.imagePlacement = .top
            configuration.imagePadding = 0
            configuration.titleAlignment = .center
            configuration.contentInsets = .zero
            configuration.background.cornerRadius = 0
            configuration.cornerStyle = .fixed
            
            $0.configuration = configuration
            $0.tintColor = .grey3
            $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        readButton.do {
            var configuration = UIButton.Configuration.plain()
            
            configuration.background.backgroundColor = .black
            configuration.attributedTitle = AttributedString("바로 읽기", attributes: AttributeContainer([
                .font: FontManager.body3.font,
            ]))
            configuration.baseForegroundColor = .white
            configuration.titleAlignment = .center
            configuration.contentInsets = .init(top: 10, leading: 16, bottom: 10, trailing: 16)
            configuration.background.cornerRadius = 4
            configuration.cornerStyle = .fixed
            
            $0.configuration = configuration
            $0.tintColor = .grey3
            $0.setContentHuggingPriority(.defaultLow, for: .horizontal)
        }
    }
    
    // MARK: - SetLayout
    override func setLayout() {
        separatorView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        storeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        downloadButton.snp.makeConstraints {
            $0.leading.equalTo(storeButton.snp.trailing).offset(9)
            $0.centerY.equalToSuperview()
        }
        readButton.snp.makeConstraints {
            $0.leading.equalTo(downloadButton.snp.trailing).offset(9)
            $0.verticalEdges.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}
