//
//  LeaguesDetailsViewController.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/20/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import UIKit

class LeaguesDetailsViewController: UIViewController {

    @IBOutlet weak var favouriteButton: UIButton!
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
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var teamsFlowLayout : UICollectionViewFlowLayout!
    var teams = [Team]()
    let teamsSubscriber = TeamsSubscriber()
    let teamsPresenter = TeamsPresenter()
    var notFavImage = UIImage(named: "notfav.png")
    var favImage = UIImage(named: "fav.png")
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
            teamsSubscriber.attachView(view: self)
            teamsPresenter.getAllTeams(query: "English Premier League")
            self.teamsCollectionView.register(UINib(nibName: "TeamsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "teamsCell")
            calculateTheTeamsCellSize()
        /******/
    }
    
    @IBAction func favouriteAction(_ sender: UIButton) {
        if favouriteButton.currentImage == favImage{
//            detailsPresenter.deleteFavoriteLeague(id: leagueFromMain?.idLeague ?? "")
            favouriteButton.setImage(notFavImage, for: .normal)
            
        }else{
//            let result = detailsPresenter.insertIntoFavoriteLeagues(league: leagueFromMain!)
//            if result{
                favouriteButton.setImage(favImage, for: .normal)
//                print(CoreDataHandler.getCoreHandlerInstance().getFavouriteLeagues())
            
//            }else{
//                print("error in adding to favorites")
//            }
        }
    }
    
}
