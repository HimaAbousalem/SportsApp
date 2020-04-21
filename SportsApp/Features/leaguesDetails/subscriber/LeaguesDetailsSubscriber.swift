//
//  LeaguesDetailsSubscriber.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/21/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation

class LeaguesDetailsSubscriber{
    weak private var detailsView: LeaguesDetailsViewDelegate?
    init() {
        NotificationCenter.default.addObserver(self, selector:#selector(loadTeams(n:)), name: .getTeams, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(loadLatestEvents(n:)), name: .getLatestEvents, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(loadNextEvents(n:)), name: .getUpcomingEvents, object: nil)

    }
    
    func attachView(view: LeaguesDetailsViewDelegate){
        self.detailsView = view
    }
    
    
    @objc func loadTeams(n:NSNotification){
        let teams = (n.userInfo?["teams"] as? [Team])!
        print("*******loaded teams size ******* \(teams.count)")
        if(teams.count > 0){
            self.detailsView?.setTeamsData(teams :teams)
        }else{
            self.detailsView?.setEmptyTeams()
            
        }
    }
        
    @objc func loadLatestEvents(n:NSNotification){
        let events = (n.userInfo?["latestEvents"] as? [Event])!
        print("*******loaded events size ******* \(events.count)")
        if(events.count > 0){
            self.detailsView?.setLatestEvents(list: events)
        }else{
            self.detailsView?.setLatestEventsEmpty()
        }
    }
    
    @objc func loadNextEvents(n:NSNotification){
        let events = (n.userInfo?["nextEvents"] as? [Event])!
        print("*******loaded events size ******* \(events.count)")
        if(events.count > 0){
            self.detailsView?.setNextEvents(list: events)
        }else{
            self.detailsView?.setNextEventsEmpty()
        }
        
    }
}
