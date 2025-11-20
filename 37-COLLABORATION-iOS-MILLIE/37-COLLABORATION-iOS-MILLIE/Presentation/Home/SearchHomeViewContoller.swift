
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
        let dummyList: [BookCategoryModel] = [
            BookCategoryModel(categoryId: 1, title: "소설", description: "추리/스릴러, 스파이, 범죄 스릴러 등", imageURL: ""),
            BookCategoryModel(categoryId: 2, title: "시/에세이", description: "에세이, 일기, 감성 글귀 등", imageURL: ""),
            BookCategoryModel(categoryId: 3, title: "경제/경영", description: "투자, 돈, 마케팅, 조직, 경영 전략", imageURL: ""),
            BookCategoryModel(categoryId: 4, title: "자기계발", description: "동기부여, 습관, 루틴, 능력 개발", imageURL: ""),
            BookCategoryModel(categoryId: 5, title: "인문학", description: "철학, 심리학, 사회학, 고전 인문", imageURL: ""),
            BookCategoryModel(categoryId: 6, title: "역사/문화", description: "세계사, 한국사, 현대사, 인물사", imageURL: ""),
            BookCategoryModel(categoryId: 7, title: "과학/기술", description: "우주, 자연과학, 공학, IT 등", imageURL: ""),
            BookCategoryModel(categoryId: 8, title: "예술/대중문화", description: "영화, 음악, 미술, 패션 등", imageURL: ""),
            BookCategoryModel(categoryId: 9, title: "취미/라이프", description: "요리, 여행, 운동, DIY, 집 꾸미기", imageURL: ""),
            BookCategoryModel(categoryId: 10, title: "유아/아동", description: "동화, 학습만화, 어린이 도서 등", imageURL: "")
        ]
        categories = dummyList

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
            image: UIImage(named: "Img_category_book2-1")
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
