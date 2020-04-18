//
//  SportsViewController.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/18/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import UIKit

class SportsViewController: UIViewController {

    @IBOutlet weak var sportsCollectionView: UICollectionView!
    var sports: [Sport] = []
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "SportCollectionViewCell", bundle: nil)
        sportsCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }
    
    func setupCollectionViewItemSize(){
        if collectionViewFlowLayout == nil{
            let itemsPerRow:CGFloat = 2
            let lineSpacing:CGFloat = 5
            let interItemSpacing:CGFloat = 5
            
            let width = (sportsCollectionView.frame.width - (itemsPerRow - 1) * interItemSpacing) / itemsPerRow
            let height = width
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: lineSpacing, left: lineSpacing, bottom: 0, right: lineSpacing)
         
            sportsCollectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
   

}
