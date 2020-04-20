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
        var upComingFlowLayout : UICollectionViewFlowLayout!
        var latestViewFlowLayout : UICollectionViewFlowLayout!
    
        var nextEvents = [Event]()
        let upComingEventPresenter = NextEventPresenter(handler: FetchNextEventsHandler())
        let upComingEventSubscriper = NextEventSubscriber()
    
        var latestEvents = [Event]()
        let latestEventPresenter = LatestEventPresenter(handler: FetchLatestEventsHandler())
        let latestEventSubscriper = LatestEventSubscriber()
    /******/
    /***ibrahim**/
    
    /******/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /***eman**/
            upComingEventSubscriper.attachView(view: self)
            upComingEventPresenter.getNextEvents()
            self.upcomingCollectionView.register(UINib(nibName: "UpComingEventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "upcomingCell")
            setUpUpcomingCollectionViewSize()
        
            latestEventSubscriper.attachView(view: self)
            latestEventPresenter.getLatestEvents()
            self.latestCollectionView.register(UINib(nibName: "LatestEventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "latestCell")
            setupLatestCollectionViewSize()
        /******/
        /***ibrahim**/
        
        /******/
    }
    

}
