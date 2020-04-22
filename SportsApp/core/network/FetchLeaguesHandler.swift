//
//  FetchLeagues.swift
//  SportsApp
//
//  Created by eman kamal on 4/18/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class FetchLeaguesHandler {
    
    func getLeagues(query: String){
        var leagues : [League] = []
        let url = "https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php"
        let sportDummy = "Fighting".replacingOccurrences(of: " ", with: "_")
        print(sportDummy)
        let parameters = ["s":query]
        
        Alamofire.request(url,parameters: parameters)
            .responseJSON{(response) -> Void in
                switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    //debugPrint(json)
                    for league in json["countrys"].arrayValue{
                        let league = League(
                            id: league["idLeague"].stringValue,
                            name:league["strLeague"].stringValue,
                            sport:league["strSport"].stringValue,
                            youtube:league["strYoutube"].stringValue,
                            badge:league["strBadge"].stringValue
                        )
                        leagues.append(league)
                    }
                    NotificationCenter.default.post(name: .getLeagues,object: nil, userInfo: ["leagues": leagues])
                case .failure(let error):
                    print(error)
                }
        }
    }
    
}
