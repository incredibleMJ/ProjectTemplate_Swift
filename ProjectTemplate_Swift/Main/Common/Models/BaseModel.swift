//
//  BaseModel.swift
//  Coin2Coin
//
//  Created by Albert on 2017/12/21.
//  Copyright © 2017年 Albert. All rights reserved.
//

import Foundation
import YYModel

class BaseModel: NSObject, NSCoding, NSCopying, YYModel {
    
    func encode(with aCoder: NSCoder) {
        yy_modelEncode(with: aCoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        yy_modelInit(with: aDecoder)
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return yy_modelCopy() ?? NSObject()
    }
    
    override var hash: Int {
        return Int(yy_modelHash())
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        return yy_modelIsEqual(object ?? NSObject())
    }
    
    override var description: String {
        return yy_modelDescription()
    }
    
}
