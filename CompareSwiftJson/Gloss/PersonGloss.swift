//
//  PersonGloss.swift
//  CompareSwiftJson
//
//  Created by 陈立宇 on 2018/4/28.
//  Copyright © 2018年 陈立宇. All rights reserved.
//

import Gloss

struct PersonGloss: Glossy {
    
    let id: Int?
    let name: String?
    let age: Int?
    let height: Int?
    let gender: GenderGloss?
    
    init?(json: JSON) {
        self.id = "person_id" <~~ json
        self.name = "username" <~~ json
        self.age = "age" <~~ json
        self.height = "height" <~~ json
        self.gender = "gender" <~~ json
        
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "person_id" ~~> self.id,
            "username" ~~> self.name,
            "age" ~~> self.age,
            "height" ~~> self.height,
            "gender" ~~> self.gender
            ])
    }
    

}
