//
//  GithubAPI.swift
//  ProjectTemplate_Swift
//
//  Created by MJ2009 on 2017/12/3.
//  Copyright © 2017年 Albert. All rights reserved.
//

import Foundation
import Moya

let networkActivityPlugin = NetworkActivityPlugin.init { (type) in
    if !Thread.current.isMainThread {
        return
    }
    switch type {
    case .began:
        Utilities.shared.checkNetworking()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    case .ended:
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

let tokenPlugin = MoyaTokenPlugin.init { () -> String in
    return Utilities.getToken()
}

let gitHubProvider = MoyaProvider<GitHub>(plugins: [NetworkLoggerPlugin(verbose: false), networkActivityPlugin, tokenPlugin])

public enum GitHub {
    case zen
    case userProfile(String)
    case userRepositories(String)
}

extension GitHub: TargetType {
    public var baseURL: URL {
        var url = URL.init(string: "http://www.google.com/")!
        if let _url = URL.init(string: Config.HTTP_BASE_URL) {
            url = _url
        }
        return url

    }
    
    public var path: String {
        switch self {
        case .zen:
            return "/zen"
        case .userProfile(let name):
            return "/users/\(name.urlEscaped)"
        case .userRepositories(let name):
            return "/users/\(name.urlEscaped)/repos"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return "test data".utf8Encoded
    }
    
    public var task: Task {
        switch self {
        case .userRepositories:
            return .requestParameters(parameters: ["sort": "pushed"], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
}
