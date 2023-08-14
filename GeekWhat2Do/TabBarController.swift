//
//  TabBarController.swift
//  GeekWhat2Do
//
//  Created by gkin on 2023/08/02.
//

import UIKit


class TabBarController: UITabBarController{
    
    var vcList: [UIViewController] = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        let userVC = UserViewController()
        userVC.tabBarItem = .init(title: "My Page",
                                  image: UIImage(systemName: "sun.and.horizon")?.withRenderingMode(.alwaysTemplate),
                                  selectedImage: UIImage(systemName: "sun.and.horizon.fill")?.withRenderingMode(.alwaysTemplate))
        userVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        
        
        let nv_userVC = UINavigationController(rootViewController: userVC)
        vcList.append(nv_userVC)
        
        
        
//        let RecordVC = RecordViewController()
//        RecordVC.tabBarItem = .init(title: "目標一覧",
//                                    image: UIImage(systemName:"book")?.withRenderingMode(.alwaysTemplate),
//                                    selectedImage: UIImage(systemName: "book.fill")?.withRenderingMode(.alwaysTemplate))
//        RecordVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
//        
//        
//        let nv_RecordVC = UINavigationController(rootViewController: RecordVC)
//        vcList.append(nv_RecordVC)
        
        
        self.tabBar.tintColor = .label
        self.setViewControllers(self.vcList, animated: false)
        self.selectedIndex = 0
    }
}

