//
//  SearchResultView.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 송성용 on 11/21/25.
//

import UIKit

import SnapKit
import Then

final class SearchResultView: BaseUIView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let totalBookCountLabel = UILabel()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 10  
        layout.sectionInset = UIEdgeInsets(top: 16, left: 11, bottom: 16, right: 11)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("SecondView Error!")
    }
    
    // MARK: - SetUp Methods
    
    func setStyle() {
        
        backgroundColor = .systemBackground
        
        titleLabel.do {
            $0.text = "도서"
            $0.font = UIFont.FontType.font(.bold, ofsize: 20)
            $0.textColor = .black
        }
        
        totalBookCountLabel.do {
            $0.text = "0"  // 임시값입니다 후에 업데이트됨
            $0.font = UIFont.FontType.font(.regular, ofsize: 14)
            $0.textColor = UIColor(named: "millie_Purple")
        }
    }
    
    override func setUI() {
        addSubviews(
            titleLabel,
            totalBookCountLabel,
            collectionView
        )
    }
    
    override func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.leading.equalToSuperview().inset(20)
        }
        
        totalBookCountLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
            $0.centerY.equalTo(titleLabel)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    // MARK: - Public Methods
    
    func updateBookCount(_ count: Int) {
        totalBookCountLabel.text = "\(count)"
    }
}

#Preview {
    SearchResultView()
}
