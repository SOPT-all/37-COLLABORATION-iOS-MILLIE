//
//  BookCategoryView.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 임소은 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class BookCategoryView: BaseUIView {

    //MARK: - UI
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    ).then {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 44, height: 100)
        layout.minimumLineSpacing = 12
        
        $0.backgroundColor = .clear
        
        $0.register(BookCategoryCell.self,
                    forCellWithReuseIdentifier: BookCategoryCell.identifier)
    }

    var heightConstraint: Constraint?

    //MARK: - setUI
    override func setUI() {
        addSubview(collectionView)
    }

    //MARK: - setLayout
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.snp.makeConstraints {
            heightConstraint = $0.height.equalTo(0).constraint
        }
    }

    //MARK: - Height 업데이트
    func updateHeight() {
        layoutIfNeeded()
        let contentHeight = collectionView.collectionViewLayout.collectionViewContentSize.height
        heightConstraint?.update(offset: contentHeight)
    }
}
