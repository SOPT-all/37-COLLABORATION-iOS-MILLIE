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

// MARK: - Networking

extension BookCategoryViewController {

    func fetchCategories() {
        Task {
            let result = await NetworkService.shared.categoryService.getCategoryList()

            switch result {
            case .success(let responseDTO):

                guard let items = responseDTO.data else { return }

                self.categories = items.map { $0.toDomain() }

                DispatchQueue.main.async {
                    self.mainView.collectionView.reloadData()
                }

            case .failure(let error):
                print("❌ BookCategoryViewController Category API Error:", error.localizedDescription)
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension BookCategoryViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int
    ) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BookCategoryCell.identifier,
            for: indexPath
        ) as? BookCategoryCell else { return UICollectionViewCell() }

        let item = categories[indexPath.item]

        cell.configure(title: item.title, description: item.description)

        if let url = URL(string: item.imageURL) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.setImage(image)
                    }
                }
            }.resume()
        }

        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension BookCategoryViewController: UICollectionViewDelegate {}
