//
//  Config.swift
//  ProjectTemplate_Swift
//
//  Created by Albert on 2017/12/5.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class Config: NSObject {
    //环境配置 (线上/测试)
    open static let isTestEnvironment = true
    
    open static let HTTP_BASE_URL = Config.isTestEnvironment ? "https://api.github.com" : "https://api.github.com"
}
