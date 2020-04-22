//
//  FavouritesTableViewController.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/21/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import UIKit
import Kingfisher
class FavouritesTableViewController: UITableViewController, FavouriteViewDelegte{
    
    var favouritePresenter :FavouritePresenter?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var favouriteLeagues = [League]()
    var closure:((String)->Void)? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "favCell")
        favouritePresenter = FavouritePresenter(coreData: appDelegate.localLeagues!, viewDelegate: self)
        favouritePresenter?.getAllLeagues()
        closure = { data in
            self.showAlert(title: "No YoutubeLink", message: data)
        }
    }
    
    func showSavedLeagues(leagues: [League]) {
        favouriteLeagues = leagues
        self.tableView.reloadData()
    }
    
    func showNoFavouritesUI() {
        print("there is no favourite")
    }
}
