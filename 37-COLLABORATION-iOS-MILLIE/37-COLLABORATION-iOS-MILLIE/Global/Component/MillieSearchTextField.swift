//
//  MillieSearchTextField.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 김나연 on 11/18/25.
//

import UIKit

import Then
import SnapKit

final class MillieSearchTextField: BaseUIView {
    
    // MARK: - UI Components
    
    private let textField = UITextField()
    private let scanButton = UIButton()
    private let clearButton = UIButton()
    
    
    // MARK: - Init
    
    public init() {
        super.init(frame: .zero)
        addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - SetUI
    
    override func setUI() {
        textField.do {
            $0.font = FontManager.body2.font
            $0.textColor = .grey4
            $0.placeholder = "검색어를 입력하세요"
            $0.layer.cornerRadius = 22
            $0.layer.masksToBounds = true
            $0.backgroundColor = .lightGrey1
            $0.setLeftIcon(.iconSearchGlass)
            $0.setPlaceholder(color: UIColor.grey1, font: FontManager.body2.font)
        }
        
        scanButton.do {
            $0.setImage(.iconHomeSearchScan, for: .normal)
        }
        
        clearButton.do {
            $0.setImage(.iconResultSearch, for: .normal)
            $0.isHidden = true
        }
    }
    
    
    // MARK: - SetLayout
    
    override func setLayout() {
        addSubviews(textField, scanButton, clearButton)
        
        textField.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(42)
        }
        
        scanButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.trailing.equalToSuperview().inset(18)
            $0.centerY.equalToSuperview()
        }
        
        clearButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.trailing.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
        }
    }
    

    // MARK: - Add Target
    
    func addTarget() {
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        clearButton.addTarget(self, action: #selector(clearText), for: .touchUpInside)
    }
}

extension MillieSearchTextField {
    @objc private func textDidChange() {
        let hasText = !(textField.text?.isEmpty ?? true)
        clearButton.isHidden = !hasText
        scanButton.isHidden = hasText
        textField.backgroundColor = hasText ? .greyWhite : .lightGrey1
    }
    
    @objc private func clearText() {
        textField.text = ""
        clearButton.isHidden = true
        scanButton.isHidden = false
    }
    
    var text: String? {
        get { textField.text }
        set { textField.text = newValue }
    }
    
    var internalTextField: UITextField {
        return textField
    }
}
