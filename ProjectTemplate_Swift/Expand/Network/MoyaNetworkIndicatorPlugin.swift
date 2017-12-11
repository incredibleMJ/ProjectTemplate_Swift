//
//  MoyaNetworkIndicatorPlugin.swift
//  ProjectTemplate_Swift
//
//  Created by Albert on 2017/12/8.
//  Copyright © 2017年 Albert. All rights reserved.
//

import Foundation
import Moya
import Result

public struct MoyaNetworkIndicatorPlugin: PluginType {
    public func willSend(_ request: RequestType, target: TargetType) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
