//
//  BaseNaviVC.swift
//  ProjectTemplate_Swift
//
//  Created by Albert on 2019/8/7.
//  Copyright © 2019 Albert. All rights reserved.
//

import UIKit

class BaseNaviVC: UINavigationController {

    //MARK: - override
    
    override var shouldAutorotate: Bool {
        return topViewController?.shouldAutorotate ?? true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return topViewController?.preferredInterfaceOrientationForPresentation ?? .portrait
    }
    
    override var childViewControllerForStatusBarStyle: UIViewController? {
        return topViewController
    }
    
    override var childViewControllerForStatusBarHidden: UIViewController? {
        return topViewController
    }
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return topViewController?.prefersHomeIndicatorAutoHidden() ?? false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
