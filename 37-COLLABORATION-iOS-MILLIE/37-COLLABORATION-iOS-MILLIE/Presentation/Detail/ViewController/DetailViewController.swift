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
    var bookId: Int? = 1
    private var bookDetailInfoData: BookDetailInfoData?
    private var toggleReviewData: ToggleReviewLikeData?
    
    
    // MARK: - UI Components
    
    let mainTableView = UITableView(frame: .zero, style: .grouped).then {
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.allowsSelection = false
        $0.keyboardDismissMode = .interactive
        $0.sectionHeaderHeight = 0
        let navHeader = DetailNavigationBarView()
        navHeader.frame = CGRect(x: 0, y: 26, width: 375, height: 50)
        navHeader.backButton.addTarget(self, action: #selector(touchUpInsideBackButton), for: .touchUpInside)
        $0.tableHeaderView = navHeader
        $0.tableFooterView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: CGFloat.leastNormalMagnitude, height: CGFloat.leastNormalMagnitude)))
        $0.register(DetailPrimaryInfoTableViewCell.self, forCellReuseIdentifier: DetailPrimaryInfoTableViewCell.identifier)
        $0.register(DetailMillieReadingReportTableViewCell.self, forCellReuseIdentifier: DetailMillieReadingReportTableViewCell.identifier)
        $0.register(DetailDescriptionTableViewCell.self, forCellReuseIdentifier: DetailDescriptionTableViewCell.identifier)
        $0.register(DetailReadingDataTableViewCell.self, forCellReuseIdentifier: DetailReadingDataTableViewCell.identifier)
        $0.register(DetailRelatedBookTableViewCell.self, forCellReuseIdentifier: DetailRelatedBookTableViewCell.identifier)
        $0.register(DetailReviewTableViewCell.self, forCellReuseIdentifier: DetailReviewTableViewCell.identifier)
    }
    
    let detailBottomBarView = DetailBottomBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bookId {
            Task {
                await getBookDetailInfo(bookId: bookId)
            }
        }
    }
    
    override func setUI() {
        navigationController?.navigationBar.isHidden = true
        view.addSubviews(mainTableView, detailBottomBarView)
    }
    
    override func setLayout() {
        mainTableView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
        }
        detailBottomBarView.snp.makeConstraints {
            $0.top.equalTo(mainTableView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func setDelegate() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
}

extension DetailViewController {
    @objc private func touchUpInsideBackButton() {
        navigationController?.popViewController(animated: true)
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
            if let bookDetailInfoData {
                cell.configure(bookDetailInfoData: bookDetailInfoData)
                cell.updateBackgroundColor = { color in
                    tableView.backgroundColor = color
                }
            }
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
            if let bookDetailInfoData {
                cell.configure(bookDetailInfoData: bookDetailInfoData)
            }
            cell.reloadForNewHeight = {
                // reloadRows로 실행하면 첫번째 터치 때 업데이트 안되는 버그가 있음 (이유는 모르겠음)
                tableView.reloadData()
            }
            return cell
        case .review:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailReviewTableViewCell.identifier, for: indexPath) as? DetailReviewTableViewCell else {
                return UITableViewCell()
            }
            if let bookDetailInfoData {
                cell.reviewView.bind(bookDetailInfoData.reviews)
            }
            return cell
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

// MARK: - Network

extension DetailViewController {
    func getBookDetailInfo(bookId: Int) async {
        let result = await NetworkService.shared.detailService.getBookDetailInfo(bookId: bookId)

        switch result {
        case .success(let data):
            guard let dto = data.data else { return }
            bookDetailInfoData = dto
            mainTableView.reloadData()
        case .failure(let error):
            print("❌ 도서 상세 정보 조회 실패: \(error)")
        }
    }
    
    @objc func handleLikeButtonTapped(_ sender: LikeButton) {
        let reviewId = sender.reviewId
        print("좋아요 클릭됨, reviewId = \(reviewId)")
        Task {
            await toggleReviewLike(reviewId)
        }
    }
    
    func toggleReviewLike(_ reviewId: Int) async {
        let result = await NetworkService.shared.detailService.toggleReviewLike(reviewId: reviewId)
        switch result {
        case .success(let data):
            guard let dto = data.data else { return }
            toggleReviewData = dto
            if let index = bookDetailInfoData?.reviews.firstIndex(where: { $0.reviewId == reviewId }) {
                bookDetailInfoData?.reviews[index].liked = dto.liked
                bookDetailInfoData?.reviews[index].likeCount = dto.likeCount
            }
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
            print("👍 성공: \(data)")
            
        case .failure(let error):
            print("❌ 실패: \(error)")
        }
    }
}
