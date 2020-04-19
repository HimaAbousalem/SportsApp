//
//  LeagueView.swift
//  SportsApp
//
//  Created by eman kamal on 4/18/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
protocol LeagueView : NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setLeagues()
    func setEmpty()
}
