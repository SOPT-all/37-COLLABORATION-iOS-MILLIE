//
//  ShortcutSectonView.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 임소은 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class ShortcutSectionView: BaseUIView {
    
    //MARK: -  더미데이터
    
    private let items: [(icon: UIImage?, title: String)] = [
        (UIImage(named: "Icon_home_ranking"), "밀리 랭킹"),
        (UIImage(named: "Icon_home_Newbook"), "새로 들어온 책"),
        (UIImage(named: "icon_detail_next"), "공개 예정")
    ]
    
    //MARK: - UI Component
    
    private let titleLabel = UILabel().then {
        $0.text = "바로가기"
        $0.textColor = .black
        $0.font = UIFont(name: "NotoSansKR-Bold", size: 18)

    }
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    ).then {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.estimatedItemSize = CGSize(width: 10, height: 80) 
        
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        $0.register(
            ShortcutCell.self,
            forCellWithReuseIdentifier: ShortcutCell.identifier
        )
        
        $0.dataSource = self
        $0.delegate = self
    }
    
    //MARK: - Set UI
    
    override func setUI() {
        addSubviews(titleLabel, collectionView)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(24)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(101)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension ShortcutSectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ShortcutCell.identifier,
            for: indexPath
        ) as? ShortcutCell else { return UICollectionViewCell() }
        
        let data = items[indexPath.item]
        cell.configure(icon: data.icon, title: data.title)
        
        return cell
    }
}


// MARK: - UICollectionViewDelegate

extension ShortcutSectionView: UICollectionViewDelegate {}
