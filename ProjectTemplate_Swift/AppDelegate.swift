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
        configGlobalUI()
        Bugly.start(withAppId: "")
        
//        self.window?.rootViewController = checkToken() ? TabBarController() : TestViewController()
        self.window?.rootViewController = UINavigationController.init(rootViewController: TestViewController())
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        return true
    }
    
    func configGlobalUI() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = Theme.mainColor
        
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = Theme.mainColor
    }
    
    func checkToken() -> Bool {
        var isTokenValid = false
        let sema = DispatchSemaphore.init(value: 0)
        userProvider.request(UserAPI.firstValidate(token: Utilities.getToken()), callbackQueue: DispatchQueue.global()) { (result) in
            switch result {
            case .failure(let error):
                debugPrint(error.localizedDescription)
            case .success(let response):
                do {
                    let json = try response.mapString()
                    let responseModel = ResponseModel.nonNilDeserialize(json)
                    
                    if responseModel.success == 1 {
                        isTokenValid = true
                    } else {
                        debugPrint(responseModel.error.message)
                    }
                } catch {
                    debugPrint(error.localizedDescription)
                }
            }
            sema.signal()
        }
        sema.wait()
        return isTokenValid
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
