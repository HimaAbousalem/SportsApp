//
//  SportsPresenter.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation

class SportsPresenter: SportPresenterDelegate{
    
    func getSportsData() {
        FetchSports.Instance.getAllSports()
        
    }
    
}
