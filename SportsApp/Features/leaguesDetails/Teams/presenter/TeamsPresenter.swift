//
//  TeamsPresenter.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/20/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
class TeamsPresenter: TeamsPresenterDelegate{
   
    func getAllTeams(query: String){
        DataRepository.Instance.getAllTeamsInALeague(query: query)
    }
}
