
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
    private var categories: [BookCategoryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        fetchCategories()
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

// MARK: - Dummy Networking
extension SearchHomeViewController {
    private func fetchCategories() {
        categories = BookCategoryDummy.categories
            homeView.bookCategoryView.collectionView.reloadData()
            homeView.bookCategoryView.updateHeight()
    }
}

// MARK: - UICollectionViewDataSource
extension SearchHomeViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BookCategoryCell.identifier,
            for: indexPath
        ) as? BookCategoryCell else { return UICollectionViewCell() }

        let item = categories[indexPath.item]

        cell.configure(
            title: item.title,
            description: item.description,
            image: UIImage(named: item.imageURL)
        )

        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension SearchHomeViewController: UICollectionViewDelegate {

    func scrollViewDidLayoutSubviews(_ scrollView: UIScrollView) {
        homeView.bookCategoryView.updateHeight()
    }
}
