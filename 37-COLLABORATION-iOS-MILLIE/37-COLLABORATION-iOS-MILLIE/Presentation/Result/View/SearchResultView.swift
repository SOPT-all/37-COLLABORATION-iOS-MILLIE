//
//  SearchResultView.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 송성용 on 11/21/25.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class SearchResultView: BaseUIView {
    
    // MARK: - UI Components
    
    private let navigationTitleLabel = UILabel()
    private let navigationButton = UIButton()
    private let titleLabel = UILabel()
    private let totalBookCountLabel = UILabel()
    private let textField = MillieSearchTextField()
    
    private let bannerContainerView = UIView()
    private let bannerTitleLabel = UILabel()
    private let bannerContentLabel = UILabel()
    private let bannerImageView = UIImageView()
    
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
        cv.isScrollEnabled = false
        return cv
    }()
    
    // MARK: - Post UI Components
    
    private let postTitleLabel = UILabel()
    private let postCountLabel = UILabel()
    
    // MARK: - Library UI Components
    
    private let libraryTitleLabel = UILabel()
    private let libraryCountLabel = UILabel()
    
    lazy var postCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        layout.sectionInset = UIEdgeInsets(top: 16, left: 22, bottom: 0, right: 22)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    lazy var libraryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        cv.isScrollEnabled = false
        return cv
    }()
    
    private let viewAllButton = UIButton()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("SecondView Error!")
    }
    
    // MARK: - SetUp Methods
    
    override func setUI() {
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
            $0.text = "0"
            $0.font = FontManager.body1.font
            $0.textColor = UIColor(named: "millie_Purple")
        }
        
        bannerContainerView.do {
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
        
        bannerTitleLabel.do {
            $0.font = FontManager.subhead4.font
            $0.textColor = .grey4
            $0.numberOfLines = 1
        }
        
        bannerContentLabel.do {
            $0.font = FontManager.body1.font
            $0.textColor = .grey3
            $0.numberOfLines = 1
        }
        
        bannerImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        categoryTabs.do {
            $0.size = .small
        }
        
        postTitleLabel.do {
            $0.text = "포스트"
            $0.font = FontManager.headline.font
            $0.textColor = .black
        }
        
        postCountLabel.do {
            $0.text = "736"
            $0.font = FontManager.body1.font
            $0.textColor = UIColor(named: "millie_Purple")
        }
        
        libraryTitleLabel.do {
            $0.text = "서재"
            $0.font = FontManager.headline.font
            $0.textColor = .black
        }
        
        libraryCountLabel.do {
            $0.text = "4"
            $0.font = FontManager.body1.font
            $0.textColor = UIColor(named: "millie_Purple")
        }
        
        viewAllButton.do {
            $0.setTitle("전체 보기", for: .normal)
            $0.setTitleColor(.greyBlack, for: .normal)
            $0.titleLabel?.font = FontManager.body2.font
            $0.backgroundColor = .systemGray6
            $0.layer.cornerRadius = 8
        }
        
        addSubviews(
            navigationTitleLabel,
            navigationButton,
            textField,
            categoryTabs,
            scrollView
        )
        
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            titleLabel,
            totalBookCountLabel,
            collectionView,
            bannerContainerView,
            postTitleLabel,
            postCountLabel,
            postCollectionView,
            libraryTitleLabel,
            libraryCountLabel,
            libraryCollectionView,
            viewAllButton
        )
        
        bannerContainerView.addSubviews(
            bannerTitleLabel,
            bannerContentLabel,
            bannerImageView
        )
    }
    
    override func setLayout() {
        
        navigationTitleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(14)
            $0.centerX.equalToSuperview()
        }
        
        navigationButton.snp.makeConstraints {
            $0.centerY.equalTo(navigationTitleLabel)
            $0.leading.equalToSuperview().inset(13)
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(navigationTitleLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(18)
        }
        
        categoryTabs.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(categoryTabs.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
       
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().inset(24)
        }
        
        totalBookCountLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(6)
            $0.centerY.equalTo(titleLabel)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(800)
        }
        
        bannerContainerView.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(329)
            $0.height.equalTo(84)
        }
        
        bannerTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(21)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(206)
            $0.height.equalTo(18)
        }
        
        bannerContentLabel.snp.makeConstraints {
            $0.top.equalTo(bannerTitleLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(27)
            $0.width.equalTo(206)
            $0.height.equalTo(16)
        }
        
        bannerImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(26)
            $0.bottom.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(60)
        }
        
        postTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().inset(24)
        }
        
        postCountLabel.snp.makeConstraints {
            $0.leading.equalTo(postTitleLabel.snp.trailing).offset(6)
            $0.centerY.equalTo(postTitleLabel)
        }
        
        postCollectionView.snp.makeConstraints {
            $0.top.equalTo(postTitleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(590)
        }
        
        viewAllButton.snp.makeConstraints {
            $0.top.equalTo(postCollectionView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(329)
            $0.height.equalTo(38)
        }
        
        libraryTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().inset(24)
        }
        
        libraryCountLabel.snp.makeConstraints {
            $0.leading.equalTo(libraryTitleLabel.snp.trailing).offset(6)
            $0.centerY.equalTo(libraryTitleLabel)
        }
        
        libraryCollectionView.snp.makeConstraints {
            $0.top.equalTo(libraryTitleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        showBookView()
    }
    
    // MARK: - Public Methods
    
    func updateTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func updateBookCount(_ count: Int) {
        totalBookCountLabel.text = "\(count)"
    }
    
    func getTextField() -> MillieSearchTextField {
        return textField
    }
    
    func getSearchText() -> String? {
        return textField.text
    }
    
    func showBookView() {
        titleLabel.isHidden = false
        totalBookCountLabel.isHidden = false
        collectionView.isHidden = false
        bannerContainerView.isHidden = false
        
        postTitleLabel.isHidden = true
        postCountLabel.isHidden = true
        postCollectionView.isHidden = true
        viewAllButton.isHidden = true
        libraryTitleLabel.isHidden = true
        libraryCountLabel.isHidden = true
        libraryCollectionView.isHidden = true
        

        
        bannerContainerView.snp.remakeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(329)
            $0.height.equalTo(84)
            $0.bottom.equalToSuperview().inset(40) // contentView의 bottom과 연결
        }
    }
    
    func showPostView() {
        postTitleLabel.isHidden = false
        postCountLabel.isHidden = false
        postCollectionView.isHidden = false
        viewAllButton.isHidden = false
        
        titleLabel.isHidden = true
        totalBookCountLabel.isHidden = true
        collectionView.isHidden = true
        bannerContainerView.isHidden = true
        libraryTitleLabel.isHidden = true
        libraryCountLabel.isHidden = true
        libraryCollectionView.isHidden = true
        
        viewAllButton.snp.remakeConstraints {
            $0.top.equalTo(postCollectionView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(329)
            $0.height.equalTo(38)
            $0.bottom.equalToSuperview().inset(40) // contentView의 bottom과 연결
        }
    }
    
    func showLibraryView() {
        libraryTitleLabel.isHidden = false
        libraryCountLabel.isHidden = false
        libraryCollectionView.isHidden = false
        
        titleLabel.isHidden = true
        totalBookCountLabel.isHidden = true
        collectionView.isHidden = true
        bannerContainerView.isHidden = true
        postTitleLabel.isHidden = true
        postCountLabel.isHidden = true
        postCollectionView.isHidden = true
        viewAllButton.isHidden = true
        
        libraryCollectionView.snp.remakeConstraints {
            $0.top.equalTo(libraryTitleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
            $0.bottom.equalToSuperview().inset(40) // contentView의 bottom과 연결
        }
    }
    
    func updateBanner(_ banner: Banner?) {
        guard let banner = banner else {
            bannerContainerView.isHidden = true
            bannerContainerView.backgroundColor = .clear
            return
        }
        
        bannerContainerView.isHidden = false
        bannerContainerView.backgroundColor = UIColor(named: "banner_mint")
        bannerTitleLabel.text = banner.bannerTitle
        bannerContentLabel.text = banner.bannerContent
        
        if let url = URL(string: banner.bannerImageUrl) {
            bannerImageView.kf.setImage(
                with: url,
                options: [
                    .transition(.fade(0.2)),
                    .cacheOriginalImage
                ]
            )
        } else {
            print("배너 이미지 URL 오류 - bannerId: \(banner.bannerId), URL: \(banner.bannerImageUrl)")
        }
    }
    func updateCollectionViewHeight(_ height: CGFloat) {
        collectionView.snp.updateConstraints {
            $0.height.equalTo(height)
        }
    }
}
