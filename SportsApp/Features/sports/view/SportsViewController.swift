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
        NotificationCenter.default.addObserver(self, selector:#selector(recieveSportsData(notification:)), name: .getSports, object: nil)
        // subscriber = SportSubscriber()
        //subscriber.attachView(viewDelegate: self)
        let presenter = SportsPresenter()
        presenter.getSportsData()
        
    }
    
    @objc func recieveSportsData(notification: NSNotification){
        sports = (notification.userInfo?["sports"] as? [Sport])!
        print(sports.count)
        print("Hello")
//        self.sportsCollectionView.reloadData()
//           if sports != nil && sports?.count != 0{
//        viewDelegate?.showSportsData(sports: sports!)
//         }else{
//           viewDelegate?.showErrorMessage(message: "Something went wrong!")
//         }
        self.sportsCollectionView.reloadData()
    }
    
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
            
            let width = (UIScreen.main.bounds.width - (lineSpacing * 4)) / itemsPerRow
            let height = width
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: lineSpacing, left: lineSpacing, bottom: lineSpacing, right: lineSpacing)

            sportsCollectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}
