//
//  SearchHomeViewController.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 임소은 on 11/19/25.
//

import UIKit
import SnapKit
import Then

final class SearchHomeViewController: BaseUIViewController {
    
    private let homeView = SearchHomeView()
    var categories: [BookCategoryModel] = []
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        fetchCategories()
        homeView.categoryTabs.setInitialIndicatorPosition()
    }
    
    override func setDelegate() {
        homeView.bookCategoryView.collectionView.dataSource = self
        homeView.bookCategoryView.collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func setUI() {
        view.addSubviews(homeView)
    }
    
    override func setLayout() {
        homeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - Networking
extension SearchHomeViewController {

    private func fetchCategories() {
        Task {
            let result = await NetworkService.shared.categoryService.getCategoryList()

            switch result {
            case .success(let dto):
                guard let data = dto.data else { return }

                self.categories = data.map { $0.toDomain() }

                DispatchQueue.main.async {
                    self.homeView.bookCategoryView.collectionView.reloadData()
                    self.homeView.bookCategoryView.updateHeight()
                }

            case .failure(let error):
                print("❌ CategoryList API Error:", error.localizedDescription)
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension SearchHomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BookCategoryCell.identifier,
            for: indexPath
        ) as? BookCategoryCell else {
            return UICollectionViewCell()
        }
        
        let item = categories[indexPath.item]
        let isRecent = indexPath.item == 0
        cell.configure(with: item, isRecent: isRecent)
        
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

extension SearchHomeViewController: UICollectionViewDelegate {
    func scrollViewDidLayoutSubviews(_ scrollView: UIScrollView) {
        homeView.bookCategoryView.updateHeight()
    }
}
