//
//  ViewController.swift
//  CompareSwiftJson
//
//  Created by 陈立宇 on 2018/4/26.
//  Copyright © 2018年 陈立宇. All rights reserved.
//

import UIKit
import HandyJSON
import ObjectMapper
import SwiftyJSON
import Argo
import Gloss

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.parser(.HandyJson)
        self.parser(.Argo)
        self.parser(.Gloss)
        self.parser(.SwiftyJson)
        self.parser(.ObjectMapper)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    enum JsonType {
        case HandyJson
        case Argo
        case Gloss
        case SwiftyJson
        case ObjectMapper
    }
    
    func parser(_ jsonType : JsonType) {
        let jsonString = "{\"person_id\":77544,\"username\":\"Tom Li\",\"age\":18,\"height\":180,\"gender\":\"Female\"}"
        switch jsonType {
        case .HandyJson:
            self.parserHandyJSON(jsonString)
        case .Argo:
            self.parserArgo(jsonString)
        case .Gloss:
            self.parserGloss(jsonString)
        case .SwiftyJson:
            self.parserSwiftyJSON(jsonString)
        case .ObjectMapper:
            self.parserObjectMapper(jsonString)
        }
    }
    
    func parserGloss(_ string : String){
        
        let data:Data = string.data(using: String.Encoding.utf8)!
        let person:PersonGloss? = PersonGloss(data: data)
        print("******************Gloss json parser start******************")
        print(person ?? "")
        print(person?.gender ?? "");
        print(person?.name ?? "");
        print(person?.id ?? 0);
        print("******************Gloss json parser end******************")
        
    }
    func parserArgo(_ string : String){
        
        let data:Data = string.data(using: String.Encoding.utf8)!
        let j:AnyObject = try! Argo.JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.init(rawValue: 0)) as AnyObject
        print("******************Argo json start******************")
        let person: PersonArgo? = decode(j)
        print(person ?? "")
        print(person?.gender ?? "");
        print(person?.name ?? "");
        print(person?.id ?? 0);
        print("******************Argo json end******************")
    }
    func parserSwiftyJSON(_ string : String){

        let json = JSON(parseJSON: string)
        if let j = json.dictionary {
            let id = j["person_id"]!.int!
            let name = j["username"]!.string!
            let age = j["age"]!.int!
            let height = j["height"]!.int!
            let gender = j["gender"]!.string!
            let g = GenderSwiftyJSON(rawValue: gender)
            let person = PersonSwiftyJSON(id:id,name:name,age:age,height:height,gender:g)
            print("******************SwiftyJSON json start******************")
            print(person)
            print(person.gender!);
            print(person.name!);
            print(person.id!);
            print("******************SwiftyJSON json end******************")
        }
        
    }
    
    
    func parserObjectMapper(_ string : String){
        
        if let person = Mapper<PersonObjectMapper>().map(JSONString: string){
            print("******************OjectMapper json start******************")
            print(person.toJSON())
            print(person.gender!);
            print(person.name!);
            print(person.id!);
            print("******************OjectMapper json end******************")
        }
    }
    
    func parserHandyJSON(_ string : String){
        if let person = PersonHandyJSON.deserialize(from: string) {
            print("******************HandyJSON json start******************")
            print(person.toJSON()!)
            print(person.gender!);
            print(person.name!);
            print(person.id!);
            print("******************HandyJSON json end******************")
        }
    }

}

