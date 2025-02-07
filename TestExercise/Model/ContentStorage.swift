//
//  ContentStorage.swift
//  TestExercise
//
//  Created by Maks on 7.02.25.
//

import UIKit


struct ContentModel {
    var image: UIImage
    var prise: Int
    var petName: String
    var companyName: String
    var location: String
}



struct ContentStorage {
    func createContentModels() -> [ContentModel] {
        let contentArray: [ContentModel] = [
            ContentModel(image: UIImage(resource: .cat), prise: 835, petName: "Kendy From LongWay", companyName: "Bel Bison FLG feat Golden Stepway", location: "Belarus, Minsk"),
            ContentModel(image: UIImage(resource: .cat), prise: 700, petName: "Kendy From LongWay and Company", companyName: "Bel Bison FLG feat Golden Stepway startup", location: "Belarus, Minsk"),
            ContentModel(image: UIImage(resource: .dog), prise: 1100, petName: "Kendy From LongWay", companyName: "Bel Bison", location: "Belarus, Minsk"),
            ContentModel(image: UIImage(resource: .cat), prise: 755, petName: "Fisty Maddisson golden scout cat with little tail", companyName: "Golden british cats", location: "Belarus, Minsk"),
            ContentModel(image: UIImage(resource: .cat), prise: 1350, petName: "Justin Lebowsky", companyName: "Best fabrica", location: "Belarus, Minsk"),
            ContentModel(image: UIImage(resource: .dog), prise: 1500, petName: "Kendy From LongWay", companyName: "Bel Bison FLG feat Golden Stepway", location: "Belarus, Minsk"),
            ContentModel(image: UIImage(resource: .dog), prise: 800, petName: "Kendy From LongWay", companyName: "Bel Bison FLG feat Golden Stepway", location: "Belarus, Minsk"),
            ContentModel(image: UIImage(resource: .cat), prise: 550, petName: "Kendy From LongWay", companyName: "Bel Bison FLG feat Golden Stepway", location: "Belarus, Minsk"),
            ContentModel(image: UIImage(resource: .dog), prise: 1235, petName: "Kendy From LongWay", companyName: "Bel Bison FLG feat Golden Stepway", location: "Belarus, Minsk"),
            ContentModel(image: UIImage(resource: .cat), prise: 866, petName: "Kendy From LongWay", companyName: "Bel Bison FLG feat Golden Stepway", location: "Belarus, Minsk"),
            ContentModel(image: UIImage(resource: .dog), prise: 688, petName: "Kendy From LongWay", companyName: "Bel Bison FLG feat Golden Stepway", location: "Belarus, Minsk")
        ]
        
        return contentArray
    }
    
    func createBanners() -> [UIImage] {
        let bannersArray = [
            UIImage(resource: .banner),
            UIImage(resource: .banner2)
        ]
        
        return bannersArray
    }
}
