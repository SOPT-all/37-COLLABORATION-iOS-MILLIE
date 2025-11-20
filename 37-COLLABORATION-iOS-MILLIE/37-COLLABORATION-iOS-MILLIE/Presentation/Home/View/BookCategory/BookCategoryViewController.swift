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
    }
}

//MARK: - Networking

extension BookCategoryViewController {
    //TODO: - API파일 만들고 제대로 만들기..
    
    private func fetchCategories() {
        
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
            title: item.title, description: item.description, image: UIImage(named: "Img_category_book2-1") //임시이미지
        )
        
        return cell
    }
}
