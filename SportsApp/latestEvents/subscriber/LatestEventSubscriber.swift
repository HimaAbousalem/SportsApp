//
//  LatestEventSubscriber.swift
//  SportsApp
//
//  Created by eman kamal on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
class LatestEventSubscriber{
    weak private var eventView: LatestEventView?
    
    init() {
        NotificationCenter.default.addObserver(self, selector:#selector(loadLatestEvents(n:)), name: NSNotification.Name.init("latestEventsLoaded"), object: nil)
    }
    
    func attachView(view: LatestEventView){
        self.eventView = view
    }
    
    
    @objc func loadLatestEvents(n:NSNotification){
        let events = (n.userInfo?["latestEvents"] as? [Event])!
        print("*******loaded events size ******* \(events.count)")
        if(events.count > 0){
            self.eventView?.setLatestEvents(list: events)
        }else{
            self.eventView?.setEmpty()
        }
        
}
}
