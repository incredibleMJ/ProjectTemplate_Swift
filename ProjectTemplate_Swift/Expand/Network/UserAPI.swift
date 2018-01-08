//
//  UserAPI.swift
//  Coin2Coin
//
//  Created by Albert on 2018/1/2.
//  Copyright © 2018年 Albert. All rights reserved.
//

import Foundation
import Moya

let userProvider = MoyaProvider<UserAPI>(plugins: [NetworkLoggerPlugin(verbose: false), networkActivityPlugin])

enum AuthCodeType: Int {
    case login = 0
    case register
}

enum UserAPI {
    case sendAuthCode(type: AuthCodeType, phoneNum: String) //发送注册/登陆短信验证码  type: 0-登陆,1-注册
    case login(phoneNum: String, code: String, clientID: String, clientType: String) //用户登录
    case logout(userName: String, clientID: String, clientType: String) //userName: 手机号
    case firstValidate(token: String) //首次进入app判断用户token是否有效
}

extension UserAPI: TargetType {
    public var baseURL: URL {
        var url = URL.init(string: "http://www.google.com/")!
        if let _url = URL.init(string: Config.HTTP_BASE_URL) {
            url = _url
        }
        return url
    }
    
    public var path: String {
        switch self {
        case .sendAuthCode:
            return "/users/sendAuthCode"
        case .login:
            return "/users/login"
        case .logout:
            return "/users/logout"
        case .firstValidate:
            return "/users/firstValidate"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .sendAuthCode, .login, .logout:
            return .post
        default:
            return .get
        }
    }
    
    public var sampleData: Data {
        return "test data".utf8Encoded
    }
    
    public var task: Task {
        switch self {
        case .sendAuthCode(let type, let phoneNum):
            return .requestParameters(parameters: ["type": "\(type.rawValue)", "phoneNum": phoneNum], encoding: URLEncoding.httpBody)
        case .login(let phoneNum, let code, let clientID, let clientType):
            return .requestParameters(parameters: ["phoneNum": phoneNum, "code": code, "clientId": clientID, "clientType": clientType], encoding: URLEncoding.httpBody)
        case .logout(let userName, let clientID, let clientType):
            return .requestParameters(parameters: ["userName": userName, "clientId": clientID, "clientType": clientType], encoding: URLEncoding.httpBody)
        case .firstValidate:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .firstValidate(let token):
            return ["token": token]
        default:
            return nil
        }
    }
    
    
}
