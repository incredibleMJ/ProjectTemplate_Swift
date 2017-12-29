//
//  BaseRealmModel.swift
//  Coin2Coin
//
//  Created by Albert on 2017/12/15.
//  Copyright © 2017年 Albert. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import HandyJSON

/// 需要本地化存储的model继承该类
class BaseRealmModel: Object, HandyJSON {
    required init() {
        super.init()
    }

    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }

    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    func mapping(mapper: HelpingMapper) {}
    func didFinishMapping() {}
}

