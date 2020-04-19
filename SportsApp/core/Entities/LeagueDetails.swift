//
//  LeagueDetails.swift
//  SportsApp
//
//  Created by eman kamal on 4/18/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
class LeagueDetails{
    var id: String?
    var name: String?
    var sport: String?
    var youtube: String?
    var badge: String?
    
    init(id: String,name: String,sport: String,youtube: String?,badge: String){
        
        self.id = id
        self.name = name
        self.sport = sport
        self.youtube = youtube
        self.badge = badge
        
    }
    
}
