//
//  DetailTabCollectionViewCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김호성 on 2025.11.21.
//

import UIKit

import SnapKit
import Then

class DetailTabCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    let capsuleBackgroundView = UIView()
    let titleLabel = UILabel()
    
    override var isSelected: Bool {
        didSet {
            isSelected ? setSelectedUI() : setUnselectedUI()
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        isSelected = false
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUI
    private func setUI() {
        contentView.addSubview(capsuleBackgroundView)
        capsuleBackgroundView.addSubview(titleLabel)
        capsuleBackgroundView.do {
            $0.layer.cornerRadius = 17
            $0.layer.borderColor = UIColor.lightGrey2.cgColor
        }
        titleLabel.do {
            $0.font = FontManager.body1.font
        }
    }
    
    // MARK: - SetLayout
    private func setLayout() {
        capsuleBackgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(6)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    private func setSelectedUI() {
        capsuleBackgroundView.backgroundColor = .black
        capsuleBackgroundView.layer.borderWidth = 0
        titleLabel.textColor = .white
    }
    private func setUnselectedUI() {
        capsuleBackgroundView.backgroundColor = .background
        capsuleBackgroundView.layer.borderWidth = 1
        titleLabel.textColor = .black
    }
}
