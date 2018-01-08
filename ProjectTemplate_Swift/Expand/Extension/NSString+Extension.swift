//
//  NSString+Extension.swift
//  ProjectTemplate_Swift
//
//  Created by Albert on 2017/12/4.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

public extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
    /// 空字符串显示 - - 否则显示字符串本身
    var friendlyString: String {
        return self.isEmpty ? "- -" : self
    }
    
    /// 数字字符串
    ///
    /// - Parameter accuracy: 精度 (保留小数点位数)
    /// - Returns: 数字字符串
    func numStringWith(accuracy: Int) -> String {
        if isEmpty || accuracy < 0 {
            return "- -"
        }
        
        guard let doubleValue = Double(self) else {
            return "- -"
        }
        
        return doubleValue.numStringWith(accuracy: accuracy)
    }
    
    /// 验证手机号是否有效
    func isValidateMobile() -> Bool {
        let phoneRegex = "^((13[0-9])|(15[^4,\\D])|(17[^4,\\D])|(18[0,0-9]))\\d{8}$"
        let phoneTest = NSPredicate.init(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    
}
