//
//  Double+Extension.swift
//  Coin2Coin
//
//  Created by MJ2009 on 2018/1/1.
//  Copyright © 2018年 Albert. All rights reserved.
//

import Foundation

public extension Double {
    
    /// 数字字符串
    ///
    /// - Parameter accuracy: 精度 (保留小数点位数)
    /// - Returns: 数字字符串
    func numStringWith(accuracy: Int) -> String {
        if accuracy < 0 {
            return "- -"
        }
        
        if Darwin.round(self) == self {
            return String.init(format: "%.0f", self)
        } else {
            let format = NumberFormatter()
            format.numberStyle = .decimal
            format.maximumFractionDigits = accuracy
            
            if let str = format.string(from: NSNumber.init(value: self)) {
                return str
            } else {
                return "- -"
            }
        }
    }
    
}
