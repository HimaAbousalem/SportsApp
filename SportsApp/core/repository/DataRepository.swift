//
//  DataRepository.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation

class DataRepository{
    static let Instance = DataRepository()
    
    private init(){
    }
    
    func getSportsData(){
        FetchSports.Instance.getAllSports()
    }
    
    func getAllTeamsInALeague(query: String){
        FetchTeams.Instance.getAllTeams(query: query)
    }
    
    func getUpComingEventsInALeague(){
        FetchNextEventsHandler.Instance.getNextEvents()
    }
    
    func getLatestEventsInALeague(){
        FetchLatestEventsHandler.Instance.getLatestEvents()
    }
}
