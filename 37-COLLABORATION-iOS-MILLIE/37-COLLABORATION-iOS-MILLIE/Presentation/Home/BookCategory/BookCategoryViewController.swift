//
//  BookCategoryViewController.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 임소은 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class BookCategoryViewController: BaseUIViewController {
    
    //MARK: - Properties
    
    private let mainView = BookCategoryView()
    private var categories: [BookCategoryModel] = []
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        fetchCategories()
    }
    
    override func setDelegate() {
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
    }
}

//MARK: - Networking

extension BookCategoryViewController {
    /// 실제 API 나중에 붙일 함수부분 지금은 SearchHomeViewController에서 더미데이터 받고있음
    private func fetchCategories() {
        categories = BookCategoryDummy.categories
        mainView.collectionView.reloadData()
    }
}

//MARK: - collection DataSource

extension BookCategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int
    ) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCategoryCell.identifier,
                                                            for: indexPath
        ) as? BookCategoryCell else { return UICollectionViewCell() }
        
        let item = categories[indexPath.item]
        
        cell.configure(
            title: item.title, description: item.description, image: UIImage(named: "Img_category_book2") //임시이미지
        )
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension BookCategoryViewController: UICollectionViewDelegate {}
