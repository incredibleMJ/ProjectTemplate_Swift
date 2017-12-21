//
//  BaseViewController.swift
//  ProjectTemplate_Swift
//
//  Created by Albert on 2017/12/4.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.hidesBottomBarWhenPushed = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
