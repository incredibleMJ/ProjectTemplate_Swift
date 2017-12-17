//
//  Utilities.swift
//  ProjectTemplate_Swift
//
//  Created by Albert on 2017/12/4.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class Utilities: NSObject {
    
    //MARK: - 单例对象
    static var shared = Utilities()
    private override init() {}
    override func copy() -> Any { return self }
    override func mutableCopy() -> Any { return self }
    
    //MARK: - 网络状态监听
    let manager = NetworkReachabilityManager(host: "www.baidu.com")
    var isConnected: Bool = false
    func startNetworkMonitor () {
        manager?.listener = { status in
            switch status {
            case .notReachable, .unknown:
                self.isConnected = false
                Utilities.showText("网络连接已断开!")
            case .reachable(let connectType):
                self.isConnected = true
                switch connectType {
                case .ethernetOrWiFi:
                    debugPrint("已连接到无线网络!")
                case .wwan:
                    debugPrint("已连接到蜂窝移动网络!")
                }
            }
        }
        manager?.startListening()
    }
    
    //MARK: - 弹提示框
    //弹出转圈圈
    static func showLoading() {
        Utilities.hideHUD()
        MBProgressHUD.showAdded(to: Constant.keyWindow, animated: true)
    }
    
    //弹出带有文字的转圈圈
    static func showLoading(withText text: String?) {
        Utilities.hideHUD()
        let hud = MBProgressHUD.showAdded(to: Constant.keyWindow, animated: true)
        hud.label.text = text
        hud.label.font = UIFont.systemFont(ofSize: 15)
    }
    
    //弹出文字提示
    static func showText(_ text: String) {
        Utilities.hideHUD()
        let hud = MBProgressHUD.showAdded(to: Constant.keyWindow, animated: true)
        hud.mode = .text
        hud.label.text = text
        hud.label.font = UIFont.systemFont(ofSize: 15)
        hud.label.numberOfLines = 3
        hud.hide(animated: true, afterDelay: 2)
    }
    
    //隐藏提示框
    static func hideHUD() {
        MBProgressHUD.hide(for: Constant.keyWindow, animated: true)
    }
    
}
