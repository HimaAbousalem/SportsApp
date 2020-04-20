//
//  NextEventView.swift
//  SportsApp
//
//  Created by eman kamal on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
protocol NextEventView : NSObjectProtocol {
    func setNextEvents(list : [Event])
    func setEmpty()
}
