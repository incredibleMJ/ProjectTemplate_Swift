//
//  ResponseModel.swift
//  Coin2Coin
//
//  Created by MJ2009 on 2018/1/4.
//  Copyright © 2018年 Albert. All rights reserved.
//

import UIKit
import HandyJSON

struct ResponseModel: HandyJSON {
    var success: Int = 0
    var error = Error()
    
    struct Error {
        var code = ""
        var message = ""
    }
}
