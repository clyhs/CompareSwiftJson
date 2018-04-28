//
//  PersonHandyJSON.swift
//  CompareSwiftJson
//
//  Created by 陈立宇 on 2018/4/27.
//  Copyright © 2018年 陈立宇. All rights reserved.
//

import UIKit
import HandyJSON

struct PersonHandyJSON: HandyJSON {
    var id: Int?
    var name: String?
    var age: Int?
    var height: Int?
    var gender: GenderHandyJSON?
    
    mutating func mapping(mapper: HelpingMapper) {
        mapper <<< [
            self.id <-- "person_id",
            self.name <-- "username"
        ]
    }
    
}
