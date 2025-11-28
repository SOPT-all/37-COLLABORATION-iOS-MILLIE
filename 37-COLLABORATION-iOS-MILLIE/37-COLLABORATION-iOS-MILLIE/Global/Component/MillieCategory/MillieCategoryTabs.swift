//
//  MillieCategoryTabs.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/20/25.
//
// 아요 사랑해!!!
import UIKit

import Then
import SnapKit

protocol MillieCategoryTabsDelegate: AnyObject {
    func didMillieCategoryTabsTab(index: Int)
}

final class MillieCategoryTabs: BaseUIView {
    
    enum CategoryTabsConfigure {
        case small
        case big
        
        var titles: [String] {
            switch self {
            case .small:
                return ["도서", "밀리로드", "포스트", "서재"]
            case .big:
                return ["카테고리", "웹툰/웹소설", "오디오", "작가", "컬렉션"]
            }
        }
        
        var interItemSpacing: CGFloat {
            switch self {
            case .small: return 48
            case .big:   return 20
            }
        }
        
        var height: CGFloat {
            switch self {
            case .small: return 45
            case .big:   return 45
            }
        }
        
        var inset: CGFloat {
            switch self {
            case .small: return 36
            case .big:   return 22
            }
        }
        
        var hasBorders: Bool {
            self == .small
        }
    }
    
    weak var delegate: MillieCategoryTabsDelegate?
    
    private var targetIndex: Int = 0 {
        didSet {
            moveIndicator(targetIndex: targetIndex)
        }
    }
    
    private var titles: [String] = []

    public var size: CategoryTabsConfigure = .big {
        didSet {
            applySizeStyle()
            titles = size.titles
            collectionView.reloadData()
            layoutIfNeeded()
        }
    }
    
    
    // MARK: - UI Components
    
    private let indicatorView = UIView()
    private let topBorder = UIView()
    private let bottomBorder = UIView()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titles = size.titles
        setInitialIndicatorPosition()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUI
    
    override func setUI() {
        collectionView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(MillieTabCell.self, forCellWithReuseIdentifier: MillieTabCell.identifier)
        }
        
        indicatorView.do {
            $0.backgroundColor = .greyBlack
        }
        
        topBorder.do {
            $0.backgroundColor = size.hasBorders ? .lightGrey2 : .clear
        }
        
        bottomBorder.do {
            $0.backgroundColor = size.hasBorders ? .lightGrey2 : .clear
        }
        
        addSubviews(topBorder, collectionView, bottomBorder, indicatorView)
    }
    
    
    // MARK: - SetLayout
    
    override func setLayout() {
        topBorder.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        bottomBorder.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(topBorder.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomBorder.snp.bottom)
        }
        
        indicatorView.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.width.equalTo(0)
            $0.bottom.equalTo(bottomBorder.snp.top)
        }
        
    }
    
    private func applySizeStyle() {
        topBorder.backgroundColor = size.hasBorders ? .lightGrey2 : .clear
        bottomBorder.backgroundColor = size.hasBorders ? .lightGrey2 : .clear
    }
}

extension MillieCategoryTabs {
    /// 인디케이터 관련 함수
    func moveIndicator(targetIndex: Int) {
        let indexPath = IndexPath(item: targetIndex, section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        guard let cell = collectionView.cellForItem(at: indexPath) as? MillieTabCell else {return}
        indicatorView.snp.remakeConstraints {
            $0.centerX.equalTo(cell)
            $0.width.equalTo(cell.getTitleWidth())
            $0.height.equalTo(2)
            $0.bottom.equalTo(bottomBorder.snp.top)
        }
        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
    }
        
    func setIndicatorBar(to targetIndex: Int) {
        self.targetIndex = targetIndex
    }
    
    func setInitialIndicatorPosition() {
        DispatchQueue.main.async {
            self.collectionView.layoutIfNeeded()
            self.setIndicatorBar(to: 0)
        }
    }
}

extension MillieCategoryTabs: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = titles[indexPath.item]
        let width = text.getTextContentSize(withFont: FontManager.body3.font).width
        return CGSize(width: width, height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = size.inset
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return size.interItemSpacing
    }
}

extension MillieCategoryTabs: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MillieTabCell.identifier, for: indexPath) as?
        MillieTabCell else { return UICollectionViewCell() }
        let title = titles[indexPath.item]
        cell.configure(text: title)
        return cell
    }
}

extension MillieCategoryTabs: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        self.targetIndex = index
        delegate?.didMillieCategoryTabsTab(index: index)
    }
}
