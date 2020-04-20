//
//  LeaguesDetailsViewController.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/20/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import UIKit

class LeaguesDetailsViewController: UIViewController {

    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    @IBOutlet weak var latestCollectionView: UICollectionView!
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    /***eman**/
        var collectionViewFlowLayout : UICollectionViewFlowLayout!
        var nextEvents = [Event]()
        let eventPresenter = NextEventPresenter(handler: FetchNextEventsHandler())
        let eventSubscriper = NextEventSubscriber()
    /******/
    /***ibrahim**/
    
    /******/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /***eman**/
            eventSubscriper.attachView(view: self)
            eventPresenter.getNextEvents()
            self.upcomingCollectionView.register(UINib(nibName: "UpComingEventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "upcomingCell")
            setupCollectionViewItemSize()
        /******/
        /***ibrahim**/
        
        /******/
    }
    

}
