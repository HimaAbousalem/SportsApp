//
//  SportsSubscriber.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation

class SportSubscriber{
    var viewDelegate: SportViewDelegate?
    init() {
        NotificationCenter.default.addObserver(self, selector:#selector(recieveSportsData(notification:)), name: .getSports, object: nil)
    }
    func attachView(viewDelegate: SportViewDelegate){
        self.viewDelegate = viewDelegate
    }
    
    @objc func recieveSportsData(notification: NSNotification){
        let sports = (notification.userInfo?["sports"] as? [Sport])
        print(sports?.count ?? 0)
        print("Hello")
        if sports != nil && sports?.count != 0{
            viewDelegate?.showSportsData(sports: sports!)
        }else{
            viewDelegate?.showErrorMessage(message: "Something went wrong!")
        }
    }
}
