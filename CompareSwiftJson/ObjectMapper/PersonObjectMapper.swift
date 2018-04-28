//
//  PersonObjectMapper.swift
//  CompareSwiftJson
//
//  Created by 陈立宇 on 2018/4/27.
//  Copyright © 2018年 陈立宇. All rights reserved.
//

import ObjectMapper

class PersonObjectMapper: Mappable {
    var id: Int?
    var name: String?
    var age: Int?
    var height: Int?
    var gender: GenderObjectMapper?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        id <- map["person_id"]
        name <- map["username"]
        age <- map["age"]
        height <- map["height"]
        gender <- map["gender"]
    }
}
