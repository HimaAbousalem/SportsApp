//
//  NextEventPresenter.swift
//  SportsApp
//
//  Created by eman kamal on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
class NextEventPresenter {
    private let handler: FetchNextEventsHandler
    
    init(handler: FetchNextEventsHandler) {
        self.handler = handler
    }
    
    func getNextEvents(){
        self.handler.getNextEvents()
    }
}
