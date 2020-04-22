//
//  FavouriteTableViewLogic.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/22/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension FavouritesTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteLeagues.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! LeagueTableViewCell
        cell.leagueName.text = favouriteLeagues[indexPath.row].name
        cell.youtubeLink = favouriteLeagues[indexPath.row].youtube
        cell.youtubeClosure = closure
        cell.leagueBadge.kf.setImage(with: URL(string: favouriteLeagues[indexPath.row].badge), placeholder: UIImage(named: "noImagePlaceholder.png"))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Reachability.isConnectedToNetwork(){
            //go to details
        }else{
            showAlert(title: "Error!", message: "Please check your connection!")
        }
    }
    
    func showAlert(title : String , message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
