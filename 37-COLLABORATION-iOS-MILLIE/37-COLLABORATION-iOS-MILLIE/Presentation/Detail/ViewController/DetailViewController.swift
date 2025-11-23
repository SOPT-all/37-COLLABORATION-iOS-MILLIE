//
//  ViewController.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/16/25.
//

import UIKit

import SnapKit

class DetailViewController: BaseUIViewController {
    
    // MARK: - Properties
    let bookDetailModel: BookDetailModel = BookDetailModel(
        bookId: 1,
        bookCoverImageUrl: URL(string: "naver.com")!,
        bookTitle: "홍학의 자리",
        bookAuthor: "정해연",
        bookType: "소설",
        publishedDate: "2021.07.21",
        bookRate: 3.9,
        totalReviewCount: 2,
        completionRate: 80,
        bookDescription: "\"이 행복이 영원할 거라고 생각한 적은 없었다. 그러나 이런 끝을 상상한 적도 없었다.\"예측 불가! 한국 미스터리 사상 전무후무한 반전! 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구",
        reviews: [
            BookDetailModel.ReviewModel(
                reviewId: 1,
                bookId: 1,
                reviewerName: "마침표수집가",
                createdDate: "2025.09.20",
                reviewContent: "이야기의 흐름보다 분위기와 감정이 중심이라 호불호는 있을 듯. 하지만 저는 좋았습니다.",
                liked: false,
                likeCount: 58
            ),
            BookDetailModel.ReviewModel(
                reviewId: 2,
                bookId: 1,
                reviewerName: "소다맛마시멜로우",
                createdDate: "2025.10.28",
                reviewContent: "하 읽은 사람들이랑 수다떨고싶다....",
                liked: false,
                likeCount: 126
            ),
        ]
    )
    
    // MARK: - UI Components
    let detailNavigationBarView = DetailNavigationBarView()
    
    let mainTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.allowsSelection = false
        $0.keyboardDismissMode = .interactive
        $0.contentInsetAdjustmentBehavior = .never
        $0.register(DetailPrimaryInfoTableViewCell.self, forCellReuseIdentifier: DetailPrimaryInfoTableViewCell.identifier)
        $0.register(DetailMillieReadingReportTableViewCell.self, forCellReuseIdentifier: DetailMillieReadingReportTableViewCell.identifier)
        $0.register(DetailDescriptionTableViewCell.self, forCellReuseIdentifier: DetailDescriptionTableViewCell.identifier)
        $0.register(DetailReadingDataTableViewCell.self, forCellReuseIdentifier: DetailReadingDataTableViewCell.identifier)
        $0.register(DetailRelatedBookTableViewCell.self, forCellReuseIdentifier: DetailRelatedBookTableViewCell.identifier)
    }
    
    override func setUI() {
        view.addSubviews(mainTableView, detailNavigationBarView)
    }
    
    override func setLayout() {
        detailNavigationBarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        mainTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        detailNavigationBarView.backButton.addTarget(self, action: #selector(touchUpInsideBackButton), for: .touchUpInside)
        detailNavigationBarView.likeButton.addTarget(self, action: #selector(touchUpInsideLikeButton), for: .touchUpInside)
        detailNavigationBarView.moreButton.addTarget(self, action: #selector(touchUpInsideMoreButton), for: .touchUpInside)
    }
    
    override func setDelegate() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
}

extension DetailViewController {
    @objc private func touchUpInsideBackButton() {
        
    }
    @objc private func touchUpInsideLikeButton() {
        
    }
    @objc private func touchUpInsideMoreButton() {
        
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    enum MainTableViewSection: Int, CaseIterable {
        case primaryInfo
        case millieReadingReport
        case description
        case review
        case readingData
        case relatedBook
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView().then { $0.backgroundColor = .lightGrey1 }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let section = MainTableViewSection(rawValue: section) else {
            return 0
        }
        switch section {
        case .primaryInfo, .millieReadingReport:
            return 3
        case .description, .review, .readingData:
            return 5
        case .relatedBook:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MainTableViewSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = MainTableViewSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch section {
        case .primaryInfo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailPrimaryInfoTableViewCell.identifier, for: indexPath) as? DetailPrimaryInfoTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(bookDetailModel: bookDetailModel)
            tableView.backgroundColor = cell.bookImageView.image?.averageColor
            return cell
        case .millieReadingReport:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailMillieReadingReportTableViewCell.identifier, for: indexPath) as? DetailMillieReadingReportTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case .description:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailDescriptionTableViewCell.identifier, for: indexPath) as? DetailDescriptionTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(bookDetailModel: bookDetailModel)
            return cell
        case .review:
            // TODO: - 나연님
            return UITableViewCell()
        case .readingData:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailReadingDataTableViewCell.identifier, for: indexPath) as? DetailReadingDataTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case .relatedBook:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailRelatedBookTableViewCell.identifier, for: indexPath) as? DetailRelatedBookTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
}
