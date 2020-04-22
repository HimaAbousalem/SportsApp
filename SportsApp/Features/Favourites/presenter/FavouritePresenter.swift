//
//  FavouritePresenter.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/21/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation

class FavouritePresenter{
    
    var localLeagues: LeaguesDatabaseHandler?
    var leaguseView: FavouriteViewDelegte?
    
    init(coreData: LeaguesDatabaseHandler, viewDelegate: FavouriteViewDelegte){
        self.localLeagues = coreData
        self.leaguseView = viewDelegate
    }
    func getAllLeagues(){
        let leagues = localLeagues?.getLocalLeagues()
        if leagues?.count != 0{
            leaguseView?.showSavedLeagues(leagues: leagues!)
        }else{
            leaguseView?.showNoFavouritesUI()
        }
    }
}
