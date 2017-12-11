//
//  GithubAPI.swift
//  ProjectTemplate_Swift
//
//  Created by MJ2009 on 2017/12/3.
//  Copyright © 2017年 Albert. All rights reserved.
//

import Foundation
import Moya

let gitHubProvider = MoyaProvider<GitHub>(plugins: [NetworkLoggerPlugin(verbose: false), MoyaNetworkIndicatorPlugin()])

public enum GitHub {
    case zen
    case userProfile(String)
    case userRepositories(String)
}

extension GitHub: TargetType {
    public var baseURL: URL {
        return URL.init(string: Config.BASE_URL)!
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
