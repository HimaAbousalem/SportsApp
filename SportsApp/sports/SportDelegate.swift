//
//  SportProtocol.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/19/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation

protocol SportViewDelegate{
    func showSportsData(sports:[Sport])
    func showErrorMessage(message: String)
}

protocol SportPresenterDelegate {
    func getSportsData()
}
