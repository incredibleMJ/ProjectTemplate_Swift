//
//  Singleton.swift
//  Coin2Coin
//
//  Created by Albert on 2017/12/26.
//  Copyright © 2017年 Albert. All rights reserved.
//

import Foundation

class Singleton: NSObject {
    
    //MARK: - 单例
    static var shared = Singleton()
    private override init() {}
    override func copy() -> Any { return self }
    override func mutableCopy() -> Any { return self }
    
    //MARK: - 属性
    
    
    
}
