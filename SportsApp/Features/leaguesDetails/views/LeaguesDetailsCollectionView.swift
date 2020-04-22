//
//  LeaguesDetailsCollectionView.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/20/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
import UIKit

extension LeaguesDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var itemsCount = 0
        if collectionView == upcomingCollectionView{
            itemsCount = nextEvents.count
        }else if collectionView == latestCollectionView{
            itemsCount = latestEvents.count
        }else if collectionView == teamsCollectionView{
            itemsCount = teams.count
        }
        return itemsCount
    }
    


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == upcomingCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as! UpComingEventsCollectionViewCell
            let event = nextEvents[indexPath.row]
            let name = event.name
            let teams = name.components(separatedBy: "vs")
            cell.team1.text = teams[0]
            cell.team2.text = teams[1]
            cell.date.text = event.date
            cell.time.text = event.time
            cell.backgroundColor = UIColor.red
            return cell
        }else if collectionView == latestCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestCell", for: indexPath) as! LatestEventsCollectionViewCell
            let event = latestEvents[indexPath.row]
            cell.team1.text = event.homeTeam
            cell.team2.text = event.awayTeam
            print("score 1 is \(event.homeScore)")
            print("score 2 is \(event.awayScore)")
            /*if let score1 = event.homeScore{
                cell.score1.text = score1
            }else{
                cell.score1.text = "0"
            }
            if let score2 = event.awayScore{
                cell.score2.text = score2
            }else{
                cell.score2.text = "0"
            }*/
            cell.date.text = event.date
            cell.time.text = event.time
            
            cell.backgroundColor = UIColor.lightGray
            return cell
        }else if collectionView == teamsCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as! TeamsCollectionViewCell
            cell.teamImage.kf.setImage(with: URL(string: teams[indexPath.row].strTeamBadge)!, placeholder: UIImage(named: "noImagePlaceholder.png"))
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == teamsCollectionView{
            print(teams[indexPath.row].strTeam)
            self.performSegue(withIdentifier: "teamDetailsSegue", sender: indexPath.row)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "teamDetailsSegue"){
            let teamDetailsVC = segue.destination as! TeamDetailsViewController
            var team : Team?
            if let index = sender{
                team = teams[index as! Int]
            }
            teamDetailsVC.team = team
            
        }
    }
    
    @IBAction func unWindToLeaguesDetails(segue: UIStoryboardSegue){
        
    }
}
