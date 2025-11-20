//
//  MillieCategoryTabs.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/20/25.
//

import UIKit

import Then
import SnapKit

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
        
        var spacing: CGFloat {
            switch self {
            case .small: return 48
            case .big:   return 20
            }
        }
        
        var hasBorders: Bool {
            self == .small
        }
        
        var spacerHidden: Bool {
            self == .small
        }
    }
    
    public var onTabSelected: ((Int) -> Void)?
    public private(set) var selectedIndex: Int = 0
    
    private var buttons: [UIButton] = []
    private var underlineLeading: Constraint?
    private var underlineWidth: Constraint?

    public var size: CategoryTabsConfigure = .big {
        didSet {
            applySizeStyle()
            configureTabs()
            setNeedsLayout()
            layoutIfNeeded()
            updateUnderline(animated: false)
        }
    }
    
    
    // MARK: - UI Components
    
    private let stackView = UIStackView()
    private let underlineView = UIView()
    private let topBorder = UIView()
    private let bottomBorder = UIView()
    private let underlineSpacer = UIView()
    
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTabs()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - SetUI
    
    override func setUI() {
        stackView.do {
            $0.axis = .horizontal
            $0.spacing = size.spacing
            $0.alignment = .center
        }
                
        underlineView.do {
            $0.backgroundColor = .greyBlack
        }
        
        topBorder.do {
            $0.backgroundColor = size.hasBorders ? .lightGrey2 : .clear
        }
        
        bottomBorder.do {
            $0.backgroundColor = size.hasBorders ? .lightGrey2 : .clear
        }
        
        underlineSpacer.do {
            $0.backgroundColor = .clear
            $0.isHidden = size.spacerHidden
        }
        
        addSubviews(topBorder, stackView, bottomBorder, underlineView, underlineSpacer)
    }
    
    
    // MARK: - SetLayout
    
    override func setLayout() {
        topBorder.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        bottomBorder.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(stackView.snp.bottom)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(topBorder.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        underlineView.snp.makeConstraints {
            $0.height.equalTo(2)
            underlineWidth = $0.width.equalTo(0).constraint
            underlineLeading = $0.leading.equalToSuperview().constraint
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(bottomBorder.snp.top)
        }
        
        underlineSpacer.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(9)
            $0.bottom.equalTo(bottomBorder.snp.top)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateUnderline(animated: false)
    }
    
    
    /// 카테고리 설정
    private func configureTabs() {
        buttons.forEach { $0.removeFromSuperview() }
        buttons.removeAll()
        
        size.titles.enumerated().forEach { idx, title in
            let btn = UIButton(type: .system)
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(.greyBlack, for: .normal)
            btn.titleLabel?.font = FontManager.body3.font
            btn.tag = idx
            btn.addTarget(self, action: #selector(tabTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(btn)
            buttons.append(btn)
        }
        selectedIndex = 0
    }
    
    private func applySizeStyle() {
        stackView.spacing = size.spacing
        topBorder.backgroundColor = size.hasBorders ? .lightGrey2 : .clear
        bottomBorder.backgroundColor = size.hasBorders ? .lightGrey2 : .clear
        underlineSpacer.isHidden = size.spacerHidden
    }
}

extension MillieCategoryTabs {
    @objc private func tabTapped(_ sender: UIButton) {
        selectTab(sender.tag, animated: true)
        onTabSelected?(sender.tag)
    }
        
    public func selectTab(_ index: Int, animated: Bool) {
        selectedIndex = index
        
        for (i, btn) in buttons.enumerated() {
            btn.titleLabel?.font = i == index ? FontManager.subhead4.font : FontManager.body3.font
        }
        
        updateUnderline(animated: animated)
    }
        
    private func updateUnderline(animated: Bool) {
        guard buttons.indices.contains(selectedIndex) else { return }

        let target = buttons[selectedIndex]
        
        underlineLeading?.update(offset: target.frame.minX)
        underlineWidth?.update(offset: target.frame.width)
        
        guard animated else {
            layoutIfNeeded()
            return
        }
        
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: { self.layoutIfNeeded() })
    }
}
