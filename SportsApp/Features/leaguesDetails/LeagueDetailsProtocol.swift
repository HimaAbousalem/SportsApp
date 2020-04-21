//
//  LeagueDetailsContract.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/21/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation

protocol LeaguesDetailsPresenterDelegate{
    func getAllTeams(query: String)
    func getNextEvents()
    func getLatestEvents()
    func saveLeagueToDatabase(league: League)
    func isFavouite(leagueId: String) -> Bool
    func deleteFromFavourite(leagueId: String)
}

protocol LeaguesDetailsViewDelegate: NSObjectProtocol{
    //upcomingEvents
    func setNextEvents(list : [Event])
    func setNextEventsEmpty()
    //latestEvents
    func setLatestEvents(list : [Event])
    func setLatestEventsEmpty()
    //teams
    func setTeamsData(teams:[Team])
    func setEmptyTeams()
}
