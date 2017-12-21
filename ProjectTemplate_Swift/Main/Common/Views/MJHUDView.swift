//
//  MJHUDView.swift
//  Coin2Coin
//
//  Created by MJ2009 on 2017/12/21.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit
import MBProgressHUD

class MJHUDView: MBProgressHUD {
    
    @discardableResult
    override static func showAdded(to superView: UIView, animated: Bool) -> MJHUDView {
        let hud = MJHUDView.init(view: superView)
        hud.removeFromSuperViewOnHide = true
        superView.addSubview(hud)
        hud.show(animated: animated)
        
        Utilities.shared.showedHuds.append(hud)
        return hud
    }

}
