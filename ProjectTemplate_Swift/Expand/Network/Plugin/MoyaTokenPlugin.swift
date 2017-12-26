
//
//  MoyaTokenPlugin.swift
//  Coin2Coin
//
//  Created by Albert on 2017/12/26.
//  Copyright © 2017年 Albert. All rights reserved.
//

import Foundation
import Moya

public struct MoyaTokenPlugin: PluginType {
    public let tokenClosure: () -> String
    
    public init(tokenClosure: @escaping () -> String) {
        self.tokenClosure = tokenClosure
    }
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        request.setValue(tokenClosure(), forHTTPHeaderField: "token")
        return request
    }
}
