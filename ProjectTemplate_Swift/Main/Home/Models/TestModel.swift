//
//  TestModel.swift
//  ProjectTemplate_Swift
//
//  Created by MJ2009 on 2017/12/3.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

struct Store: Codable {
    var name: String
    var aisles: [Aisle]
    
    struct Aisle: Codable {
        var name: String
        var shelves: [Shelf]
        
        struct Shelf: Codable {
            var name: String
            var product: Product
            
            struct Product: Codable {
                var name: String
                var price: Double
                var desc: String?
                
                private enum CodingKeys: String, CodingKey {
                    case name
                    case price = "points"
                    case desc = "description"
                }
            }
            
        }
        
    }
    
}

struct TestModel2: Codable {
    
    /// 与服务器字段一致
    var id: Int = 0
    
    /// 与服务器字段映射
    var repoName = ""
    
    var format = ""
    var filename = ""
    
    private enum CodingKeys: String, CodingKey {
        case id
        case repoName = "name"
        case format
        case filename
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // 这样处理，不怕服务器返回数据没有字段
        id = (try? values.decode(Int.self, forKey: .id)) ?? 0
        repoName = (try? values.decode(String.self, forKey: .repoName)) ?? ""
        format = (try? values.decode(String.self, forKey: .format)) ?? ""
        filename = (try? values.decode(String.self, forKey: .filename)) ?? ""
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(repoName, forKey: .repoName)
        try container.encode(format, forKey: .format)
        try container.encode(filename, forKey: .filename)
    }
    
}
