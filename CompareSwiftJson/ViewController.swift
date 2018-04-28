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

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.deserializationHandyJSON()
        self.deserializationObjectMapper()
        self.deserializationSwiftyJSON()
        self.deserializationArgo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    enum jsonType {
        case HandyJson
        case Argo
        case Gloss
        case SwiftyJson
        case ObjectMapper
    }
    
    func deserializationArgo(){
        
        let jsonString = "{\"person_id\":77544,\"username\":\"Tom Li\",\"age\":18,\"height\":180,\"gender\":\"Female\"}"
        //let json:Any = Argo.JSON.string(jsonString)
        //let a:AnyObject? = Argo.JSON(json) as AnyObject
        let data:Data = jsonString.data(using: String.Encoding.utf8)!
        let j:AnyObject = try! Argo.JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.init(rawValue: 0)) as AnyObject
        //if let j: AnyObject = a {
        print("Argo json start")
        let person: PersonArgo? = decode(j)
        print(person ?? "")
        print(person?.gender ?? "");
        print(person?.name ?? "");
        print(person?.id ?? 0);
        //}
        
        
    }
    func deserializationSwiftyJSON(){
        let jsonString = "{\"person_id\":77544,\"username\":\"Tom Li\",\"age\":18,\"height\":180,\"gender\":\"Female\"}"
        let json = JSON(parseJSON: jsonString)
        if let j = json.dictionary {
            let id = j["person_id"]!.int!
            let name = j["username"]!.string!
            let age = j["age"]!.int!
            let height = j["height"]!.int!
            let gender = j["gender"]!.string!
            let g = GenderSwiftyJSON(rawValue: gender)
            let person = PersonSwiftyJSON(id:id,name:name,age:age,height:height,gender:g)
            
            print("SwiftyJSON json start")
            print(person)
            print(person.gender!);
            print(person.name!);
            print(person.id!);
        }
        
    }
    
    
    func deserializationObjectMapper(){
        
        let jsonString = "{\"person_id\":77544,\"username\":\"Tom Li\",\"age\":18,\"height\":180,\"gender\":\"Female\"}"
        
        if let person = Mapper<PersonObjectMapper>().map(JSONString: jsonString){
            print("OjectMapper json start")
            print(person.toJSON())
            print(person.gender!);
            print(person.name!);
            print(person.id!);
        }
        
        
    }
    
    func deserializationHandyJSON(){
        
        let jsonString = "{\"person_id\":77544,\"username\":\"Tom Li\",\"age\":18,\"height\":180,\"gender\":\"Female\"}"

        if let person = PersonHandyJSON.deserialize(from: jsonString) {
            print("HandyJSON json start")
            print(person.toJSON()!)
            print(person.gender!);
            print(person.name!);
            print(person.id!);
        }
        
    }

}

