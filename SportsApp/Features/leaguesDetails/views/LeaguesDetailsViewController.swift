//
//  LeaguesDetailsViewController.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/20/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import UIKit

class LeaguesDetailsViewController: UIViewController, LeaguesDetailsViewDelegate {
    
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    @IBOutlet weak var latestCollectionView: UICollectionView!
    @IBOutlet weak var teamsCollectionView: UICollectionView!

    var upComingFlowLayout : UICollectionViewFlowLayout!
    var latestViewFlowLayout : UICollectionViewFlowLayout!
    var league : League?
    var nextEvents = [Event]()
    var leagueDetailsPresenter :LeaguesDetailsPresenter?
    let leagueDetailsSubscriber = LeaguesDetailsSubscriber()
    var latestEvents = [Event]()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var teamsFlowLayout : UICollectionViewFlowLayout!
    var teams = [Team]()
    var notFavImage = UIImage(named: "notfav.png")
    var favImage = UIImage(named: "fav.png")
    var noUpcomingEvents: UIImageView?
    var noTeams: UIImageView?
    var noLatestEvents: UIImageView?
    var destinaton: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        leagueDetailsPresenter = LeaguesDetailsPresenter.init(coreData: appDelegate.localLeagues!)
        leagueDetailsSubscriber.attachView(view: self)
        
        leagueDetailsPresenter!.getNextEvents(query: (league?.id)!)
        self.upcomingCollectionView.register(UINib(nibName: "UpComingEventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "upcomingCell")
        setUpUpcomingCollectionViewSize()
        
        leagueDetailsPresenter!.getLatestEvents(query: (league?.id)!)
        self.latestCollectionView.register(UINib(nibName: "LatestEventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "latestCell")
        setupLatestCollectionViewSize()
        
        if (leagueDetailsPresenter?.isFavouite(leagueId: league?.id ?? ""))!{
            favouriteButton.setImage(favImage, for: .normal)
        }else{
            favouriteButton.setImage(notFavImage, for: .normal)
        }
        
        noUpcomingEvents = UIImageView(image: UIImage(named: "event.png"))
        noUpcomingEvents?.contentMode = .center
        upcomingCollectionView.backgroundView = noUpcomingEvents
        
        noLatestEvents = UIImageView(image: UIImage(named: "event.png"))
        noLatestEvents?.contentMode = .center
        latestCollectionView.backgroundView = noLatestEvents
        
        noTeams = UIImageView(image: UIImage(named: "event.png"))
        noTeams?.contentMode = .center
        teamsCollectionView.backgroundView = noTeams
        
        let swipeLeft = UISwipeGestureRecognizer()
        swipeLeft.addTarget(self, action: #selector(backSegue) )
        swipeLeft.direction = .left
        self.view!.addGestureRecognizer(swipeLeft)
        
        leagueDetailsPresenter!.getAllTeams(query: (league?.name)!)
        self.teamsCollectionView.register(UINib(nibName: "TeamsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "teamsCell")
            calculateTheTeamsCellSize()
    }
    
    @IBAction func favouriteAction(_ sender: UIButton) {
        if favouriteButton.currentImage == favImage{
            favouriteButton.setImage(notFavImage, for: .normal)
            leagueDetailsPresenter?.deleteFromFavourite(leagueId: (league?.id) ?? "")
        }else{
            favouriteButton.setImage(favImage, for: .normal)
            leagueDetailsPresenter?.saveLeagueToDatabase(league: league!)
        }
    }
    
    @IBAction func backSegue() {
        performSegue(withIdentifier: destinaton!, sender: self)
    }
}
