//
//  NextEventSubscriber.swift
//  SportsApp
//
//  Created by eman kamal on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
class NextEventSubscriber{
    weak private var eventView: NextEventView?
    
    init() {
        NotificationCenter.default.addObserver(self, selector:#selector(loadNextEvents(n:)), name: NSNotification.Name.init("NextEventsLoaded"), object: nil)
    }
    
    func attachView(view: NextEventView){
        self.eventView = view
    }
    
    
    @objc func loadNextEvents(n:NSNotification){
        let events = (n.userInfo?["nextEvents"] as? [Event])!
        print("*******loaded events size ******* \(events.count)")
        if(events.count > 0){
            self.eventView?.setNextEvents(list: events)
        }else{
            self.eventView?.setNextEventsEmpty()
        }
        
    }
}
