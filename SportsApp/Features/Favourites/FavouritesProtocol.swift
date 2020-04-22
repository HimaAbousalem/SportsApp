//
//  FavouritesProtocol.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/22/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation

protocol FavouritePresenterDelegate {
    
}

protocol FavouriteViewDelegte {
    func showSavedLeagues(leagues: [League])
    func showNoFavouritesUI()
}
