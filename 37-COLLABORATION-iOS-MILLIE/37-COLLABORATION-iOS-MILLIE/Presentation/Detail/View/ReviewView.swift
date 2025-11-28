//
//  ReviewView.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/22/25.
//

import UIKit

import Then
import SnapKit

final class ReviewView: BaseUIView {
    
    // MARK: - Properties
    
    private var data: [ToggleReviewLikeData] = []
    private var collectionViewHeightConstraint: Constraint?
    
    
    // MARK: - UI Components
    
    private let header = ReviewHeaderView()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.register(ReviewCell.self, forCellWithReuseIdentifier: ReviewCell.identifier)
        return cv
    }()
    
    
    // MARK: - SetUI
    
    override func setUI() {
        addSubviews(header, collectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
        let contentHeight = collectionView.collectionViewLayout.collectionViewContentSize.height
        collectionViewHeightConstraint?.update(offset: contentHeight)
    }

    
    // MARK: - SetLayout
    
    override func setLayout() {
        header.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.trailing.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(header.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(30)
            $0.height.greaterThanOrEqualTo(291)
            $0.width.equalToSuperview()
            self.collectionViewHeightConstraint = $0.height.equalTo(291).constraint
        }
    }
    
    
    // MARK: - Public bind
    
    func bind(_ data: [ToggleReviewLikeData]) {
        self.data = data
        header.setReviewCount(count: data.count)
        collectionView.reloadData()
    }
}

extension ReviewView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let review = data[indexPath.item]
        let text = review.reviewContent
        let width = collectionView.bounds.width - 32
        let textHeight = text.getTextHeight(withConstrainedWidth: width, font: FontManager.body1.font)
        let height = 106 + textHeight
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 35
    }
}

extension ReviewView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCell.identifier, for: indexPath) as?
        ReviewCell else { return UICollectionViewCell() }
        cell.dataBind(data: data[indexPath.item])
        return cell
    }
}

extension ReviewView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("셀 선택됨: \(indexPath.row)")
    }
}
