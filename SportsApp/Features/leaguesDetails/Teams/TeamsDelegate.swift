//
//  TeamsViewDelegate.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/20/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation

protocol TeamsViewDelegate: NSObjectProtocol{
    func setTeamsData(teams:[Team])
    func setEmpty()
}

protocol TeamsPresenterDelegate{
    func getAllTeams(query: String)
}
