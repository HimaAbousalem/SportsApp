//
//  SportsViewController.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/18/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import UIKit

class SportsViewController: UIViewController, SportViewDelegate {
  
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    var sports: [Sport] = []
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "SportCollectionViewCell", bundle: nil)
        sportsCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
        setupCollectionViewItemSize()
        let subscriber = SportSubscriber()
        subscriber.attachView(viewDelegate: self)

        let presenter = SportsPresenter()
        presenter.getSportsData()
        
    }
    
//    @objc func recieveSportsData(notification: NSNotification){
//        sports = (notification.userInfo?["sports"] as? [Sport])!
//        print(sports?.count)
//        print("Hello")
//        self.sportsCollectionView.reloadData()
        //   if sports != nil && sports?.count != 0{
        //viewDelegate?.showSportsData(sports: sports!)
        // }else{
        //   viewDelegate?.showErrorMessage(message: "Something went wrong!")
        // }
        
//    }
    
    func showSportsData(sports: [Sport]) {
        self.sports = sports
        //DispatchQueue.main.async {
            self.sportsCollectionView.reloadData()
       // }
    }
    
    func showErrorMessage(message: String) {
        print(message)
    }
    
    func setupCollectionViewItemSize(){
        if collectionViewFlowLayout == nil{
            let itemsPerRow:CGFloat = 2
            let lineSpacing:CGFloat = 5
            let interItemSpacing:CGFloat = 5
//13
            
            let width = ((sportsCollectionView.frame.size.width - (itemsPerRow  * interItemSpacing)) / itemsPerRow)+13
//            let width = sportsCollectionView.frame.size.width / itemsPerRow
            let height = width
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: lineSpacing, left: lineSpacing, bottom: 0, right: lineSpacing)

            sportsCollectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}
