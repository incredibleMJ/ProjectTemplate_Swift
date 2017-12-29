//
//  AppDelegate.swift
//  ProjectTemplate_Swift
//
//  Created by Albert on 2017/11/30.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit
import RealmSwift
import Bugly

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Utilities.shared.startNetworkMonitor()
        realmMigration()
        Bugly.start(withAppId: "")
        configGlobalUI()
        return true
    }
    
    func configGlobalUI() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = Theme.mainColor
        
        UITabBar.appearance().isTranslucent = false
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: Theme.mainColor], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.lightGray], for: .normal)
    }

    //MARK: - Realm Stuff
    
    func realmMigration() {
        let config = Realm.Configuration.init(schemaVersion: 0)
        Realm.Configuration.defaultConfiguration = config
        do {
            let _ = try Realm()
            debugPrint("============Documents path:\(Constant.SANDBOX_DOC_PATH)")
        } catch {
            debugPrint("Documents path:\(Constant.SANDBOX_DOC_PATH)==========Error:\(error.localizedDescription)")
        }
    }


}
