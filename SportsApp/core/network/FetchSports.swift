//
//  FetchSports.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class FetchSports {
    static let Instance = FetchSports()
    
    private init(){
        
    }
    func getAllSports(){
        let url = "https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
        var sports: [Sport] = []
        Alamofire.request(url)
            .responseJSON { (response) -> Void in
                switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    for sport in json["sports"].arrayValue{
                        sports.append(Sport(id: sport["idSport"].stringValue, name: sport["strSport"].stringValue, image: sport["strSportThumb"].stringValue))
                    }
                    //use Notification Center or clousers.
                    debugPrint(sports)
                case .failure(let error):
                    debugPrint(error)
                }
        }
    }
}
