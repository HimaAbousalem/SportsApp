//
//  League.swift
//  SportsApp
//
//  Created by eman kamal on 4/18/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
class League{
    var id: String?
    var name: String?
    var sport: String?
    
    init(id: String,name: String,sport: String){
        self.id = id
        self.name = name
        self.sport = sport
    }
}
