//
//  Notification.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let getSports
        = NSNotification.Name("Sports")
    static let getLeagues
        = NSNotification.Name("Leagues")
    static let getUpcomingEvents
        = NSNotification.Name("UpcomingEvents")
    static let getTeams
        = NSNotification.Name("Teams")
    static let getLatestEvents
        = NSNotification.Name("LatestEvents")
    static let getTeamDetails
        = NSNotification.Name("TeamDetails")
}
