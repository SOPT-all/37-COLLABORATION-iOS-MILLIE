//
//  DetailRelatedBookTableViewCell.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김호성 on 2025.11.23.
//

import UIKit

import SnapKit
import Then

class DetailRelatedBookTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    let relatedBooks: [DetailRelatedBook] = [
        DetailRelatedBook(image: .imgDetailBook1, title: "사탄탱고", author: "크러스너호르커이"),
        DetailRelatedBook(image: .imgDetailBook2, title: "고래", author: "천명권"),
        DetailRelatedBook(image: .imgDetailBook3, title: "상체 파동", author: "류츠신라"),
    ]
    
    // MARK: - UI Components
    let headerView = UIView()
    let titleLabel = UILabel()
    let moreButton = UIButton()
    let bookCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 16
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUI
    private func setUI() {
        backgroundColor = .background
        contentView.addSubviews(headerView, bookCollectionView)
        headerView.addSubviews(titleLabel, moreButton)
        titleLabel.do {
            $0.text = "이 책과 비슷한 책"
            $0.textColor = .black
            $0.font = FontManager.subhead4.font
        }
        moreButton.do {
            $0.setImage(.iconDetailNext, for: .normal)
        }
        bookCollectionView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
            $0.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
            $0.register(DetailBookCollectionViewCell.self, forCellWithReuseIdentifier: DetailBookCollectionViewCell.identifier)
            $0.dataSource = self
        }
    }
    
    // MARK: - SetLayout
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        moreButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.trailing.verticalEdges.equalToSuperview()
        }
        bookCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(19)
            $0.height.equalTo(261)
        }
    }
}

extension DetailRelatedBookTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return relatedBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailBookCollectionViewCell.identifier, for: indexPath) as? DetailBookCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(relatedBook: relatedBooks[indexPath.item])
        return cell
    }
}
