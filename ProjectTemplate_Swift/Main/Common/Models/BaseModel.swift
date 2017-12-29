//
//  BaseModel.swift
//  Coin2Coin
//
//  Created by Albert on 2017/12/21.
//  Copyright © 2017年 Albert. All rights reserved.
//

import Foundation
import HandyJSON

/// 只需 model json 互转而不用本地存储的 且有继承需求的 model 继承该类 ，无需本地化存储且无继承特性的 model 直接用 struct 定义，然后遵守 HandyJSON 协议就好
class BaseModel: HandyJSON {
    required init() {}
    func mapping(mapper: HelpingMapper) {}
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
