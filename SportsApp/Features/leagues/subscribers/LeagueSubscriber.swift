//
//  LeagueSubscriber.swift
//  SportsApp
//
//  Created by eman kamal on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
class LeagueSubscriber{
    weak private var leagueView: LeagueView?
    
    init() {
        NotificationCenter.default.addObserver(self, selector:#selector(loadLeagues(n:)), name: .getLeagues, object: nil)
    }
    
    func attachView(view: LeagueView){
        self.leagueView = view
    }
        
    @objc func loadLeagues(n:NSNotification){
        let leagues = (n.userInfo?["leagues"] as? [League])!
        print("*******loaded leagues size ******* \(leagues.count)")
        if(leagues.count > 0){
            self.leagueView?.setLeagues(list :leagues)
        }else{
            self.leagueView?.setEmpty()
        }
        
    }
   
}
