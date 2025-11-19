//
//  MillieTabBar.swift
//  sopt-37th-Assignment
//
//  Created by 김나연 on 11/14/25.
//

import UIKit

class MillieTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        appearance()
    }

    func setTabBar() {
        let vc1 = UINavigationController(rootViewController: ViewController())
        vc1.tabBarItem = UITabBarItem(title: "투데이", image: .navToday, tag: 1)
        let vc2 = UINavigationController(rootViewController: ViewController2())
        vc2.tabBarItem = UITabBarItem(title: "완독지수", image: .navWandok, tag: 2)
        let vc3 = UINavigationController(rootViewController: SearchHomeViewController())
        vc3.tabBarItem = UITabBarItem(title: "검색", image: .navSearch, tag: 3)
        let vc4 = UINavigationController(rootViewController: ViewController2())
        vc4.tabBarItem = UITabBarItem(title: "내서재", image: .navShelf, tag: 4)
        let vc5 = UINavigationController(rootViewController: ViewController())
        vc5.tabBarItem = UITabBarItem(title: "관리", image: .navSetting, tag: 5)
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
    }
    
    func appearance() {
        let barAppearance = UITabBarAppearance()
        
        // 배경
        barAppearance.configureWithOpaqueBackground()
        barAppearance.backgroundColor = .background
        barAppearance.shadowColor = .grey3
        
        // 아이콘 기본 색상 설정
        barAppearance.stackedLayoutAppearance.normal.iconColor = .grey3
        barAppearance.stackedLayoutAppearance.selected.iconColor = .subYellow
        barAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .font: FontManager.caption3.font,
            .foregroundColor: UIColor.grey3
        ]
        barAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .font: FontManager.caption3.font,
            .foregroundColor: UIColor.subYellow
        ]
        
        // 실제 탭바에 커스텀한 Appearance 적용
        self.tabBar.standardAppearance = barAppearance
        self.tabBar.scrollEdgeAppearance = barAppearance
        
        // 탭바 아이템 위치 조정
        self.tabBar.itemPositioning = .centered
    }
}
