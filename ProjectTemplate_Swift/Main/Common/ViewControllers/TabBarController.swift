//
//  TabBarController.swift
//  Coin2Coin
//
//  Created by Albert on 2017/12/12.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addChildViewController(withVC vc: UIViewController,
                                title: String,
                                imageName: String,
                                selectedImageName: String) {
        vc.title = title
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage.init(named: imageName)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage.init(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        
        let navi = UINavigationController.init(rootViewController: vc)
        self.addChildViewController(navi)
    }

}
