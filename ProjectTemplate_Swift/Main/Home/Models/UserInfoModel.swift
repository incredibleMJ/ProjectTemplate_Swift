
//
//  UserInfoModel.swift
//  Coin2Coin
//
//  Created by MJ2009 on 2017/12/17.
//  Copyright © 2017年 Albert. All rights reserved.
//

import Foundation
import HandyJSON

class UserInfoModel: BaseRealmModel {
    
    var data  = ""
    @objc dynamic var token = ""
    
    override func didFinishMapping() {
        self.token = data
    }
}
