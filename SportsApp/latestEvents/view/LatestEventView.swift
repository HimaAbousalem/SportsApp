//
//  LatestEventView.swift
//  SportsApp
//
//  Created by eman kamal on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
protocol LatestEventView : NSObjectProtocol {
    func setLatestEvents(list : [Event])
    func setEmpty()
}
