//
//  TeamsSubscriber.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/20/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation

class TeamsSubscriber{
    weak private var teamsView: TeamsViewDelegate?
    
    init() {
        NotificationCenter.default.addObserver(self, selector:#selector(loadTeams(n:)), name: .getTeams, object: nil)
    }
    
    func attachView(view: TeamsViewDelegate){
        self.teamsView = view
    }
    
    
    @objc func loadTeams(n:NSNotification){
        let teams = (n.userInfo?["teams"] as? [Team])!
        print("*******loaded teams size ******* \(teams.count)")
        if(teams.count > 0){
            self.teamsView?.setTeamsData(teams :teams)
        }else{
            self.teamsView?.setEmpty()
        }
        
    }
}
