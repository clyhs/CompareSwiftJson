//
//  GenderArgo.swift
//  CompareSwiftJson
//
//  Created by 陈立宇 on 2018/4/27.
//  Copyright © 2018年 陈立宇. All rights reserved.
//

import Argo
import Curry
import Runes

enum GenderArgo: String {
    case Male = "Male"
    case Female = "Female"
}
extension GenderArgo:Argo.Decodable { }
