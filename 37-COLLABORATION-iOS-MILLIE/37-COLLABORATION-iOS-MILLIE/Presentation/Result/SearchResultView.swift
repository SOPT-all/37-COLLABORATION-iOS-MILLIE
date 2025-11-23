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
    
    private let navigationTitleLabel = UILabel()
    private let navigationButton = UIButton()
    private let titleLabel = UILabel()
    private let totalBookCountLabel = UILabel()
    private let textField = MillieSearchTextField()
    private let adBannerImageView = UIImageView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    lazy var categoryTabs = MillieCategoryTabs()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 16, left: 21, bottom: 16, right: 21)

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
        
        navigationTitleLabel.do {
            $0.text = "검색결과"
            $0.font = FontManager.subhead5.font
        }
        
        navigationButton.do {
            $0.setImage(UIImage(named: "arrow_right"), for: .normal)
        }
        
        titleLabel.do {
            $0.text = "도서"
            $0.font = FontManager.headline.font
            $0.textColor = .black
        }
        
        totalBookCountLabel.do {
            $0.text = "0"  // 임시값입니다 후에 업데이트됨
            $0.font = FontManager.body1.font
            $0.textColor = UIColor(named: "millie_Purple")
        }
        
        adBannerImageView.do {
            $0.image = UIImage(named: "ad_banner")
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        categoryTabs.do {
            $0.size = .small
        }
    }
    
    override func setUI() {
        addSubviews(
            navigationTitleLabel,
            navigationButton,
            textField,
            categoryTabs,
            scrollView,
            adBannerImageView
        )
        
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            titleLabel,
            totalBookCountLabel,
            collectionView
        )
    }
    
    override func setLayout() {
        
        navigationTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(63)
            $0.leading.equalToSuperview().inset(148)
        }
        
        navigationButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(63)
            $0.leading.equalToSuperview().inset(13)

        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(18) // 스냅킷에서 이 설정 꼭 해주세요

        }
        
        categoryTabs.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(categoryTabs.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(adBannerImageView.snp.top)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        totalBookCountLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
            $0.centerY.equalTo(titleLabel)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(-10)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(800) 
        }
        
        adBannerImageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(23)
            $0.bottom.equalToSuperview().inset(109)
            $0.height.equalTo(84)
            $0.width.equalTo(329)
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
