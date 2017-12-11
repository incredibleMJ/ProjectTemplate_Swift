//
//  Constant.swift
//  ProjectTemplate_Swift
//
//  Created by Albert on 2017/12/4.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class Constant: NSObject {
    //MARK: - 值类型常量
    open static let SCREEN_WIDTH = UIScreen.main.bounds.width
    open static let SCREEN_HEIGHT = UIScreen.main.bounds.height
    open static let STATUS_BAR_HEIGHT = UIApplication.shared.statusBarFrame.height
    
    //MARK: - 引用类型常量
    open static let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    open static let keyWindow = Constant.appDelegate.window!
}
