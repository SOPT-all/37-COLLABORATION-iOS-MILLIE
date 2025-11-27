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
    
    private var categoryTabIndex: Int = 0
    
    private var searchResultData: SearchResultData = SearchResultData(
        keyword: "",
        bookCount: 0,
        books: [],
        banner: nil
    )
    
    // MARK: - UI Components
    
    private let rootView = SearchResultView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        rootView.categoryTabs.setInitialIndicatorPosition()
    }
    
    // MARK: - Custom Method
    
    override func setUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func registerCell() {
        rootView.collectionView.register(
            SearchResultCell.self,
            forCellWithReuseIdentifier: SearchResultCell.identifier
        )
        rootView.collectionView.register(
            LibraryCollectionViewCell.self,
            forCellWithReuseIdentifier: LibraryCollectionViewCell.identifier
        )
    }
    
    // MARK: - Delegate Method
    
    override func setDelegate() {
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
        rootView.getTextField().internalTextField.delegate = self
        rootView.categoryTabs.delegate = self
    }
}
    
// MARK: - UICollectionViewDataSource

extension SearchResultViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResultData.books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch categoryTabIndex {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SearchResultCell.identifier,
                for: indexPath
            ) as? SearchResultCell else {
                return UICollectionViewCell()
            }
            
            let book = searchResultData.books[indexPath.item]
            cell.configure(with: book)
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LibraryCollectionViewCell.identifier,
                for: indexPath
            ) as? LibraryCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

// MARK: - UICollectionViewDelegate

extension SearchResultViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedBook = searchResultData.books[indexPath.item]
    }
}

// MARK: - UITextFieldDelegate

extension SearchResultViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        guard let keyword = textField.text, !keyword.isEmpty else {
            print("검색어가 비어있습니다")
            return true
        }
        
        Task {
            await searchBooks(keyword: keyword)
        }
        
        return true
    }
}

// MARK: - MillieCategoryTabsDelegate
extension SearchResultViewController: MillieCategoryTabsDelegate {
    func didMillieCategoryTabsTab(index: Int) {
        categoryTabIndex = index
        rootView.updateTitle(MillieCategoryTabs.CategoryTabsConfigure.small.titles[index])
        rootView.collectionView.reloadData()
    }
}

// MARK: - Network

extension SearchResultViewController {
    func searchBooks(keyword: String) async {
        let result = await NetworkService.shared.searchService.searchBooks(keyword: keyword)
        
        switch result {
        case .success(let response):
            guard let data = response.data else { return }
            
            let books = data.books.map { $0.toDomain() }
            let banner = data.banner?.toDomain()
            
            searchResultData = SearchResultData(
                keyword: data.keyword,
                bookCount: data.bookCount,
                books: books,
                banner: banner
            )
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.rootView.updateBookCount(self.searchResultData.bookCount)
                self.rootView.updateBanner(self.searchResultData.banner)
                self.rootView.collectionView.reloadData()
            }
            
        case .failure(let error):
            print("도서 검색 실패: \(error)")
        }
    }
}
