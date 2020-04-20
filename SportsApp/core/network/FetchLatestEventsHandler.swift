//
//  FetchLatestEventsHandler.swift
//  SportsApp
//
//  Created by eman kamal on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class FetchLatestEventsHandler {
    
    //we need name , date , time
    func getLatestEvents(){
        var events : [Event] = []
        let url = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php"
        
        let leagueIdDummy = "4328"
        let parameters = ["id":leagueIdDummy]
        
        Alamofire.request(url,parameters: parameters)
            .responseJSON{(response) -> Void in
                switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    //debugPrint(json)
                    for event in json["events"].arrayValue {
                     let event = Event (
                         name: nil,
                         date: event["strDate"].stringValue,
                         time: event["strTime"].stringValue,
                         homeTeam: event["strHomeTeam"].stringValue,
                         awayTeam: event["strAwayTeam"].stringValue,
                         homeScore:event["intHomeScore"].stringValue,
                         awayScore: event["intAwayScore"].stringValue)
                        
                     events.append(event)
                     debugPrint("\(event.homeTeam!) , \(event.awayTeam!) , \(event.homeScore!) ,\(event.awayScore!) ,\(event.date) , \(event.time)")
                    }
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "latestEventsLoaded"), object:nil, userInfo: ["latestEvents": events])
                    
                case .failure(let error):
                    print("error !")
                }
        }
        
        
    }
    
    
}

