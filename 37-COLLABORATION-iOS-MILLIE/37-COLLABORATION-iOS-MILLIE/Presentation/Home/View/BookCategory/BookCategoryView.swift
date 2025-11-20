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
    
    //MARK: - UI Components
    
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    ).then {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 100)
        layout.minimumLineSpacing = 12
        
        $0.register(BookCategoryCell.self, forCellWithReuseIdentifier: BookCategoryCell.identifier)
        
        $0.backgroundColor = .clear
    }
    
    //MARK: - Set up
    
    override func setUI() {
        addSubview(collectionView)
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
    }
}
