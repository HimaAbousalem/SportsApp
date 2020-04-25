//
//  LatestEventsDetailsViewController.swift
//  SportsApp
//
//  Created by eman kamal on 4/20/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
import UIKit

extension LeaguesDetailsViewController{
    func setLatestEventsEmpty() {
        print("No Latest events !!")
    }
    
    func setLatestEvents(list: [Event]) {
     self.latestEvents = list.filter{latest in return latest.homeTeam != "null" && latest.homeTeam != "" && latest.awayTeam != "null" && latest.awayTeam != ""}
        if(self.latestEvents.count != 0){
            latestCollectionView.backgroundView = nil
        }
        self.latestCollectionView.reloadData()
     }
    
    func setupLatestCollectionViewSize(){
        if latestViewFlowLayout == nil{
            let lineSpacing:CGFloat = 1
            let width = UIScreen.main.bounds.width * 0.95
            let height = (UIScreen.main.bounds.height) * 0.2
            latestViewFlowLayout = UICollectionViewFlowLayout()
            latestViewFlowLayout.itemSize = CGSize(width: width, height: height)
            latestViewFlowLayout.sectionInset = UIEdgeInsets(top: lineSpacing, left: lineSpacing, bottom: lineSpacing, right: lineSpacing)
        latestCollectionView.setCollectionViewLayout(latestViewFlowLayout, animated: true)
            
        }
        
    }
}
