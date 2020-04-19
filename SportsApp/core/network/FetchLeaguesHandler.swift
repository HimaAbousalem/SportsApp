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
    
    func getLeagues(){
        let url = "https://www.thesportsdb.com/api/v1/json/1/all_leagues.php"
        let sportDummy = "Fighting"
        var ids : [String] = []
        Alamofire.request(url)
            .responseJSON{(response) -> Void in
                switch response.result{
                    
                case .success(let value):
                    let json = JSON(value)
                    //debugPrint(json)
                    for league in json["leagues"].arrayValue{
                        if league["strSport"].stringValue == sportDummy{
                            let id = league["idLeague"].stringValue
                            ids.append(id)
                        }
                    }
                    self.getLeagueDetails(ids:ids)
                
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    func getLeagueDetails(ids: [String]){
        var myLeagues : [LeagueDetails] = []
        for id in ids{
            let parameters = ["id":id]
            let url = "https://www.thesportsdb.com/api/v1/json/1/lookupleague.php"
            Alamofire.request(url,parameters: parameters)
                .responseJSON{(response) -> Void in
                    switch response.result{
                    case .success(let value):
                        let json = JSON(value)
                        //debugPrint(json)
                        for league in json["leagues"].arrayValue{
                            let myLeague = LeagueDetails(
                                id: league["idLeague"].stringValue,
                                name:league["strLeague"].stringValue,
                                sport:league["strSport"].stringValue,
                                youtube:league["strYoutube"].stringValue,
                                badge:league["strBadge"].stringValue
                            )
                            myLeagues.append(myLeague)
                            debugPrint("\(myLeague.id!),\(myLeague.name!), \(myLeague.sport!),\(myLeague.youtube!),\(myLeague.badge!)")
                        }
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LeaguesLoaded"),object: nil, userInfo: ["leagues": myLeagues])
                    case .failure(let error):
                        print(error)
                    }
            }
        }
    }

}
