//
//  FetchTeams.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class FetchTeams{
    static let Instance = FetchTeams()
    
    private init(){
        
    }
    func getAllTeams(query: String){
        let dataQuery = query.replacingOccurrences(of: " ", with: "%20")
        let url = "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=\(dataQuery)"
        var teams: [Team] = []
        Alamofire.request(url)
            .responseJSON { (response) -> Void in
                switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    teams = self.parseJson(jsonData: json)
                    NotificationCenter.default.post(name: .getTeams, object: nil, userInfo: ["teams": teams])
                case .failure(let error):
                    debugPrint(error)
                }
        }
    }
    
    func parseJson(jsonData: JSON)->[Team]{
        var teams: [Team] = []
        for team in jsonData["teams"].arrayValue{
            teams.append(Team(idTeam: team["idTeam"].stringValue, strTeam: team["strTeam"].stringValue, intFormedYear: team["intFormedYear"].stringValue, strStadium: team["strStadium"].stringValue, strStadiumThumb: team["strStadiumThumb"].stringValue, strStadiumLocation: team["strStadiumLocation"].stringValue, strTeamBadge: team["strTeamBadge"].stringValue, strYoutube: team["strYoutube"].stringValue, strCountry: team["strCountry"].stringValue))
        }
        return teams
    }
}
