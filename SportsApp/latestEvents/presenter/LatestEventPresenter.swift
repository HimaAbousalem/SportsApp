//
//  LatestEventPresenter.swift
//  SportsApp
//
//  Created by eman kamal on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
class LatestEventPresenter {
    private let handler: FetchLatestEventsHandler
    
    init(handler: FetchLatestEventsHandler) {
        self.handler = handler
    }
    
    func getLatestEvents(){
        self.handler.getLatestEvents()
    }
}
