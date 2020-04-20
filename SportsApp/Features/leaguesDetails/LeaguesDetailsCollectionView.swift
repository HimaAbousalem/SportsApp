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
    
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        var data = 0
        if collectionView == upcomingCollectionView{
//            data =
        }else if collectionView == latestCollectionView{
//            return 0
        }else if collectionView == teamsCollectionView{
//            return 0
        }
        return data
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell = nil
        if collectionView == upcomingCollectionView{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as! UpComingEventsCollectionViewCell
            cell.backgroundColor = UIColor.red
        }else if collectionView == latestCollectionView{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestCell", for: indexPath) as! LatestEventsCollectionViewCell
            cell.backgroundColor = UIColor.lightGray
        }else if collectionView == teamsCollectionView{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as! TeamsCollectionViewCell
            cell.backgroundColor = UIColor.black
        }
        return cell
    }
}
