//
//  PersonArgo.swift
//  CompareSwiftJson
//
//  Created by 陈立宇 on 2018/4/27.
//  Copyright © 2018年 陈立宇. All rights reserved.
//

import Argo
import Curry
import Runes

struct PersonArgo {
    let id: Int?
    let name: String?
    let age: Int?
    let height: Int?
    let gender: GenderArgo?
}
extension PersonArgo:Argo.Decodable{
    
    static func decode(_ j: JSON) -> Decoded<PersonArgo> {
        return curry(self.init)
            <^> j <|? "person_id"
            <*> j <|? "username"
            <*> j <|? "age"
            <*> j <|? "height"
            <*> j <|? "gender"
        
    }
    
    
    
    
    
    /*    static func create(id: Int?, name: String?, age: Int?, height: Int?, gender: GenderArgo) -> PersonArgo {
        return PersonArgo( id: id, name: name, age: age, height: height, gender: GenderArgo(rawValue: gender.rawValue))
    }
    
    static func decode(_ j: JSON) -> Decoded<PersonArgo> {
        return PersonArgo.create
            <^> j <| "person_id"
            <*> j <|? "username"
            <*> j <|? "age"
            <*> j <|? "height"
            <*> j <|? "gender"
    }*/
    
    
}
