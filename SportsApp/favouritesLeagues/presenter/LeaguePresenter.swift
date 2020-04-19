//
//  LeaguesPresenter.swift
//  SportsApp
//
//  Created by eman kamal on 4/18/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
class LeaguePresenter{
    weak private var leagueView: LeagueView?
    private let handler: FetchLeaguesHandler
    
    init(handler: FetchLeaguesHandler) {
        self.handler = handler
    }
    
    func attachView(view: LeagueView){
        self.leagueView = view
    }
    
    func getLeagues(){
        //self.leagueView?.startLoading()
        self.handler.getLeagues()
        //self.leagueView?.finishLoading()
    }
}
