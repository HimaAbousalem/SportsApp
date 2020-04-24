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
        cell.leagueBadge.kf.setImage(with: URL(string: favouriteLeagues[indexPath.row].badge), placeholder: UIImage(named: "noImagePlaceholder.png"))
        cell.youtubeClosure = closure
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Reachability.isConnectedToNetwork(){
            self.performSegue(withIdentifier: "favLeagueSegue", sender: self)
        }else{
            showAlert(title: "Error!", message: "Please check your connection!")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let indexPath = self.tableView.indexPathForSelectedRow
        var league : League?
        if let index = indexPath?.row{
            league = self.favouriteLeagues[index]
        }
        if(segue.identifier == "favLeagueSegue"){
            let leagueDetails = segue.destination as! LeaguesDetailsViewController
            leagueDetails.destinaton = "unWindToFavourite" 
            leagueDetails.league = league
        }
    }
    func showAlert(title : String , message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
