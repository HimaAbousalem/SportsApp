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
     print("######## loaded events size ######### \(list.count)")
        self.latestEvents = list
        self.latestCollectionView.reloadData()
     }
    func setupLatestCollectionViewSize(){
        if latestViewFlowLayout == nil{
            let itemsPerRow:CGFloat = 1
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
