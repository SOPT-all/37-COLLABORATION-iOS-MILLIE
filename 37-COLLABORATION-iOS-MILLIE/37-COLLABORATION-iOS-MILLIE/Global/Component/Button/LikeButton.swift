//
//  LikeButton.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/21/25.
//

import UIKit

import Then
import SnapKit

public final class LikeButton: UIButton {
    private var isLiked: Bool = false
    private var likeCount: Int = 0
    
    
    // MARK: - UI Components
    
    private let container = UIView()
    private let heartIconView = UIImageView()
    private let likeLabel = UILabel()
    private let countLabel = UILabel()
    private let stackView = UIStackView()
    
    
    // MARK: - Init
    
    public init() {
        super.init(frame: .zero)
        setUI()
        setLayout()
        addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - SetUI
    
    private func setUI() {
        container.do {
            $0.backgroundColor = .lightGrey1
            $0.layer.cornerRadius = 16
            $0.layer.masksToBounds = true
        }
        
        heartIconView.do {
            $0.image = .iconDetailHeartSmall
        }
        
        likeLabel.do {
            $0.text = "좋아요"
            $0.font = FontManager.caption3.font
            $0.textColor = .greyBlack
        }
        
        countLabel.do {
            $0.text = "121"
            $0.font = FontManager.subhead1.font
            $0.textColor = .greyBlack
        }
        
        stackView.do {
            $0.axis = .horizontal
            $0.spacing = 3
            $0.alignment = .center
        }
        
        addSubview(container)
        container.addSubview(stackView)
        stackView.addArrangedSubviews(heartIconView, likeLabel, countLabel)
    }
    
    
    // MARK: - SetLayout
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(101)
            $0.height.equalTo(34)
        }
        
        container.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    
    // MARK: - Add Target
    
    private func addTarget() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(isLikeButtonTapped))
        container.addGestureRecognizer(tap)
    }
    
    func setLikeCount(_ count: Int) {
        likeCount = count
        countLabel.text = "\(count)"
    }
}

extension LikeButton {
    @objc private func isLikeButtonTapped() {
        // 추후 구현
    }
}
