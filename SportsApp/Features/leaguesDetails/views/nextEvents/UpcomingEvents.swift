//
//  UpcomingEventsDetailsViewController.swift
//  SportsApp
//
//  Created by eman kamal on 4/20/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
import UIKit

extension LeaguesDetailsViewController{
    func setNextEventsEmpty() {
        print("No Up coming events yet!!")
    }
    func setNextEvents(list: [Event]) {
        print("######## loaded events size ######### \(list.count)")
        self.nextEvents = list
        self.upcomingCollectionView.reloadData()
    }
    
    func setUpUpcomingCollectionViewSize(){
        if upComingFlowLayout == nil{
            let itemsPerRow:CGFloat = 2
            let lineSpacing:CGFloat = 5
            let width = (UIScreen.main.bounds.width * 0.5)
            let height = (UIScreen.main.bounds.height) * 0.23
            upComingFlowLayout = UICollectionViewFlowLayout()
            upComingFlowLayout.itemSize = CGSize(width: width, height: height)
            upComingFlowLayout.sectionInset = UIEdgeInsets(top: lineSpacing, left: lineSpacing, bottom: lineSpacing, right: lineSpacing)
            upComingFlowLayout.scrollDirection = .horizontal
        upcomingCollectionView.setCollectionViewLayout(upComingFlowLayout, animated: true)
            
        }
    }
}
