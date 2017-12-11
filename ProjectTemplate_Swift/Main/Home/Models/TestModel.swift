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
