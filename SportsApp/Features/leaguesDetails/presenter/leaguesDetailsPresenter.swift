//
//  leaguesDetailsPresenter.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/21/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation

class LeaguesDetailsPresenter: LeaguesDetailsPresenterDelegate{
    var localLeagues: LeaguesDatabaseHandler?
    init(coreData: LeaguesDatabaseHandler){
        self.localLeagues = coreData
    }
    func getAllTeams(query: String) {
        DataRepository.Instance.getAllTeamsInALeague(query: query)
    }
    
    func getNextEvents() {
        DataRepository.Instance.getUpComingEventsInALeague()
    }
    
    func getLatestEvents() {
        DataRepository.Instance.getLatestEventsInALeague()
    }
    func saveLeagueToDatabase(league: League) {
        localLeagues?.saveLocalLeague(leagueObject: league)
    }
    
    func isFavouite(leagueId: String) -> Bool {
        return (localLeagues?.isFavourite(id: leagueId))!
    }
    
    func deleteFromFavourite(leagueId: String) {
        localLeagues?.deleteLeague(id: leagueId)
    }
    
    
}
