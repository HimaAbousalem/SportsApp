//
//  FetchNextEventHandler.swift
//  SportsApp
//
//  Created by eman kamal on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class FetchNextEventsHandler {
    static let Instance = FetchNextEventsHandler()
    
    private init(){
        
    }
    //we need name , date , time
    func getNextEvents(){
        var events : [Event] = []
        let url = "https://www.thesportsdb.com/api/v1/json/1/eventsnextleague.php"
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
                            name: event["strEvent"].stringValue,
                            date: event["strDate"].stringValue,
                            time: event["strTime"].stringValue,
                            homeTeam: nil,
                            awayTeam: nil,
                            homeScore: nil,
                            awayScore: nil)
                        events.append(event)
                        debugPrint("\(event.name!) ,\(event.date) ,\(event.time)")
                    }
                    NotificationCenter.default.post(name: .getUpcomingEvents, object:nil, userInfo: ["nextEvents": events])
                    
                case .failure(let error):
                    print("error !")
                }
        }
    
    
    }
    
    
}
