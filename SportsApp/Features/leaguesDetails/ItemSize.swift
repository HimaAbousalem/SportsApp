//
//  ItemSize.swift
//  SportsApp
//
//  Created by eman kamal on 4/20/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
import UIKit

extension LeaguesDetailsViewController{
    func setupCollectionViewItemSize(){
        if collectionViewFlowLayout == nil{
            let itemsPerRow:CGFloat = 2
            let lineSpacing:CGFloat = 5
            let width = (UIScreen.main.bounds.width * 0.5)
            let height = (UIScreen.main.bounds.height) * 0.23
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: lineSpacing, left: lineSpacing, bottom: lineSpacing, right: lineSpacing)
            collectionViewFlowLayout.scrollDirection = .horizontal
            upcomingCollectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
            
        }
}
}
