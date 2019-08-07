//
//  BaseViewController.swift
//  ProjectTemplate_Swift
//
//  Created by Albert on 2017/12/4.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    //MARK: - override
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return false
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
//        setNeedsStatusBarAppearanceUpdate()
//        setNeedsUpdateOfHomeIndicatorAutoHidden()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.hidesBottomBarWhenPushed = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setNeedsStatusBarAppearanceUpdate()
//        setNeedsUpdateOfHomeIndicatorAutoHidden()
    }

}
