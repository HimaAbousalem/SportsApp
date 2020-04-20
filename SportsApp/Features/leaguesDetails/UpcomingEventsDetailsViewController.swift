//
//  UpcomingEventsDetailsViewController.swift
//  SportsApp
//
//  Created by eman kamal on 4/20/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
extension LeaguesDetailsViewController: NextEventView{
    func setEmpty() {
        print("No Up coming events yet!!")
    }
    
    func setNextEvents(list: [Event]) {
        print("######## loaded events size ######### \(list.count)")
        self.nextEvents = list
        self.upcomingCollectionView.reloadData()
    }
}
