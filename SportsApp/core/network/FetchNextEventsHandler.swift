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
    func getNextEvents(query: String){
        var events : [Event] = []
        let url = "https://www.thesportsdb.com/api/v1/json/1/eventsnextleague.php"
        let parameters = ["id":query]
        
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
                            homeTeam: "",
                            awayTeam: "",
                            homeScore: "",
                            awayScore: "")
                        events.append(event)
                    }
                    NotificationCenter.default.post(name: .getUpcomingEvents, object:nil, userInfo: ["nextEvents": events])
                case .failure(let error):
                    print("error !")
                }
        }
    
    
    }
    
    
}
