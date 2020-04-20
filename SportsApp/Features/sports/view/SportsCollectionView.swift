//
//  SportsCollectionView.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/18/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension SportsViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SportCollectionViewCell

        cell.sportName.text = sports[indexPath.row].name
        cell.sportImage.kf.setImage(with: URL(string: sports[indexPath.row].image)!, placeholder: UIImage(named: "noImagePlaceholder.png"))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(sports[indexPath.row].name)
    }
    
}
