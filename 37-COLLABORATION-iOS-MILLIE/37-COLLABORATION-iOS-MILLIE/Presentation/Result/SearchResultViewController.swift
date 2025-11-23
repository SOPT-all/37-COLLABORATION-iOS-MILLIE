//
//  SearchResultViewController.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 송성용 on 11/21/25.
//

import UIKit

import SnapKit
import Then

final class SearchResultViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    private var searchResultData: SearchResultData = SearchResultResponse.mockData.data
    
    // MARK: - UI Components
    
    private let rootView = SearchResultView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        registerCell()
        setDelegate()
        rootView.updateBookCount(searchResultData.bookCount)
        rootView.categoryTabs.setInitialIndicatorPosition()
    }
    
    // MARK: - Custom Method
    
    private func setStyle() {
        view.do {
            $0.backgroundColor = .systemBackground
        }
    }
    
    private func registerCell() {
        rootView.collectionView.register(
            SearchResultCell.self,
            forCellWithReuseIdentifier: SearchResultCell.identifier
        )
    }
    
    override func setUI() {
    }
    
    override func setLayout() {
    }
    
    // MARK: - Action Method
    
    override func addTarget() {
    }
    
    // MARK: - Delegate Method
    
    override func setDelegate() {
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource
extension SearchResultViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResultData.books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SearchResultCell.identifier,
            for: indexPath
        ) as? SearchResultCell else {
            return UICollectionViewCell()
        }
        
        let book = searchResultData.books[indexPath.item]
        cell.configure(with: book)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SearchResultViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = 103
        let cellHeight: CGFloat = 180
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let totalWidth = collectionView.bounds.width
        let sectionInset: CGFloat = 21
        let cellWidth: CGFloat = 103
        let numberOfCells: CGFloat = 3
        
        let availableWidth = totalWidth - (sectionInset * 2)
        let totalCellWidth = cellWidth * numberOfCells
        let totalSpacing = availableWidth - totalCellWidth
        let numberOfGaps = numberOfCells - 1
        
        return max(0, totalSpacing / numberOfGaps)
    }
}

// MARK: - UICollectionViewDelegate
extension SearchResultViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedBook = searchResultData.books[indexPath.item]
    }
}

#Preview {
    SearchResultViewController()
}
