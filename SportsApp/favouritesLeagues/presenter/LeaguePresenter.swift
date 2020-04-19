//
//  LeaguesPresenter.swift
//  SportsApp
//
//  Created by eman kamal on 4/18/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
class LeaguePresenter{
    private let handler: FetchLeaguesHandler
    
    init(handler: FetchLeaguesHandler) {
        self.handler = handler
    }
    
    func getLeagues(){
        self.handler.getLeagues()
    }
}
