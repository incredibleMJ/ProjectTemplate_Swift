//
//  Constant.swift
//  ProjectTemplate_Swift
//
//  Created by Albert on 2017/12/4.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class Constant: NSObject {
    
    //MARK: -------------------------- 值类型常量
    open static let SCREEN_WIDTH = UIScreen.main.bounds.width
    open static let SCREEN_HEIGHT = UIScreen.main.bounds.height
    
    ///状态栏高度
    open static let STATUS_BAR_HEIGHT = UIApplication.shared.statusBarFrame.height
    
    ///导航栏高度(不包括状态栏)
    open static let NAVI_HEIGHT: CGFloat = 44.0
    
    ///tabBar高度
    open static let TAB_BAR_HEIGHT: CGFloat = 49.0
    
    ///iPhone X 底部操作条预留高度
    open static let IPX_BOTTOM_BAR_HEIGHT: CGFloat = 34.0
    
    //MARK: -------------------------- 值类型计算属性
    ///是否是 iPhone X
    open static var isIPX: Bool {
        return Constant.keyWindow.frame.height == 812.0
    }
    
    ///导航栏安全高度
    open static var safeNaviHeight: CGFloat {
        return Constant.STATUS_BAR_HEIGHT + Constant.NAVI_HEIGHT
    }
    
    ///tabBar安全高度
    open static var safeTabBarHeight: CGFloat {
        return Constant.TAB_BAR_HEIGHT + (Constant.isIPX ? Constant.IPX_BOTTOM_BAR_HEIGHT : 0)
    }
    
    ///带有不透明导航栏和不透明tabBar的页面的安全高度
    open static var safeHeightWithNaviAndTab: CGFloat {
        return Constant.SCREEN_HEIGHT - Constant.safeNaviHeight - Constant.safeTabBarHeight
    }
    
    ///带有不透明导航栏的页面的安全高度
    open static var safeHeightWithNavi: CGFloat {
        return Constant.SCREEN_HEIGHT - Constant.safeNaviHeight - (Constant.isIPX ? Constant.IPX_BOTTOM_BAR_HEIGHT : 0)
    }
    
    //MARK: -------------------------- 引用类型常量
    open static let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    open static let keyWindow = Constant.appDelegate.window!
    
    //MARK: -------------------------- 引用类型计算属性
    open static var defaultPopTheme: CNPPopupTheme {
        let theme = CNPPopupTheme.default()
        theme.popupContentInsets = UIEdgeInsets.zero
        theme.presentationStyle = .slideInFromTop
        theme.dismissesOppositeDirection = true
        return theme
    }
    
}
