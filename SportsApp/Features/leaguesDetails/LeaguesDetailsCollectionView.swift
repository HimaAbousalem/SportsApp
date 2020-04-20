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
        var data = 0
        if collectionView == upcomingCollectionView{
            data = nextEvents.count
        }else if collectionView == latestCollectionView{
            data = latestEvents.count
        }else if collectionView == teamsCollectionView{
            //            return 0
        }
        return data
    }
    
    
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == upcomingCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as! UpComingEventsCollectionViewCell
            let event = nextEvents[indexPath.row]
            let name = event.name
            let teams = name?.components(separatedBy: "vs")
            cell.team1.text = teams?[0]
            cell.team2.text = teams?[1]
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
            cell.backgroundColor = UIColor.black
            return cell
        }
        return UICollectionViewCell()
    }
}
