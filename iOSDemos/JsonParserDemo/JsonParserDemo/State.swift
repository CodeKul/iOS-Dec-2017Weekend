//
//  State.swift
//  JsonParserDemo
//
//  Created by Varun on 10/02/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import Foundation
class State {
    
    var country : String
    var name : String
    var abbr : String
    var area : String
    var largest_city : String
    var capital : String

    init(country : String, name: String, abbr : String, area : String, largest_city : String, capital : String) {
        
        self.country = country
        self.name = name
        self.abbr = abbr
        self.area = area
        self.largest_city = largest_city
        self.capital = capital
    }
}
