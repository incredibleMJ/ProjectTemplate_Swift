//
//  BaseModel.swift
//  Coin2Coin
//
//  Created by Albert on 2017/12/21.
//  Copyright © 2017年 Albert. All rights reserved.
//

import Foundation
import HandyJSON

class BaseModel: HandyJSON {
    required init() {}
}

extension Array where Element: HandyJSON {
    
    /// 从 JSON 字符串获取非空数组
    ///
    /// - Parameters:
    ///   - jsonStr: JSON 字符串
    ///   - designatedPath: 指定的 key path
    /// - Returns: model数组
    public static func nonNilDeserialize(_ jsonStr: String, designatedPath: String?) -> [Element] {
        var tmpArray = [Element]()
        if let items = [Element].deserialize(from: jsonStr, designatedPath: designatedPath) {
            items.forEach({ (item) in
                if let _item = item {
                    tmpArray.append(_item)
                }
            })
        }
        return tmpArray
    }
}
