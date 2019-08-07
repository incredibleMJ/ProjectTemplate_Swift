//
//  BaseTabVC.swift
//  Coin2Coin
//
//  Created by Albert on 2017/12/12.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class BaseTabVC: UITabBarController {
    
    //MARK: - override
    
    override var shouldAutorotate: Bool {
        return selectedViewController?.shouldAutorotate ?? true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return selectedViewController?.supportedInterfaceOrientations ?? .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return selectedViewController?.preferredInterfaceOrientationForPresentation ?? .portrait
    }
    
    override var childViewControllerForStatusBarStyle: UIViewController? {
        return selectedViewController
    }
    
    override var childViewControllerForStatusBarHidden: UIViewController? {
        return selectedViewController
    }
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return selectedViewController?.prefersHomeIndicatorAutoHidden() ?? false
    }
    
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
