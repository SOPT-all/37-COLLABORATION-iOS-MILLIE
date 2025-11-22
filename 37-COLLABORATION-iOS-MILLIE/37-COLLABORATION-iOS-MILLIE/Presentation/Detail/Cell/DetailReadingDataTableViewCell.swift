//
//  DetailReadingDataTableViewCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김호성 on 2025.11.21.
//

import UIKit

import SnapKit
import Then

class DetailReadingDataTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    let titleLabel = UILabel()
    let tabCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    let dataImageView = UIImageView()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUI
    private func setUI() {
        backgroundColor = .background
        contentView.addSubviews(titleLabel, tabCollectionView, dataImageView)
        titleLabel.do {
            $0.text = "이 책의 독서 데이터"
            $0.textColor = .black
            $0.font = FontManager.subhead4.font
        }
        tabCollectionView.do {
            $0.backgroundColor = .clear
            $0.decelerationRate = .fast
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
            $0.contentInset = .init(top: 12, left: 16, bottom: 12, right: 16)
            $0.register(DetailTabCollectionViewCell.self, forCellWithReuseIdentifier: DetailTabCollectionViewCell.identifier)
            $0.delegate = self
            $0.dataSource = self
        }
        dataImageView.do {
            $0.image = ReadingDataType.completeRate.data
            $0.contentMode = .scaleAspectFit
        }
        tabCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
    }
    
    // MARK: - SetLayout
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(16)
        }
        tabCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(58)
        }
        dataImageView.snp.makeConstraints {
            $0.top.equalTo(tabCollectionView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(30)
            $0.height.equalTo(394)
        }
    }
}

extension DetailReadingDataTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    enum ReadingDataType: Int, CaseIterable {
        case completeRate
        case popularity
        
        var title: String {
            switch self {
            case .completeRate:
                return "완독지수"
            case .popularity:
                return "연령·성별 인기"
            }
        }
        
        var data: UIImage {
            switch self {
            case .completeRate:
                return .milePickDetail
            case .popularity:
                return .ageGroupStats
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ReadingDataType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailTabCollectionViewCell.identifier, for: indexPath) as? DetailTabCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.titleLabel.text = ReadingDataType(rawValue: indexPath.item)?.title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dataImageView.image = ReadingDataType(rawValue: indexPath.item)?.data
    }
}
