//
//  FavouriteTableViewController.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/17/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import UIKit
import Kingfisher

class LeaguesTableViewController: UITableViewController,LeagueView{
    var leagues = [League]()
    let presenter = LeaguePresenter(handler: FetchLeaguesHandler())
    let subscriper = LeagueSubscriber()
    var query : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "leagueCell")
     
        subscriper.attachView(view: self)
        presenter.getLeagues(sportsQuery: query!)

        let swipeLeft = UISwipeGestureRecognizer()
        swipeLeft.addTarget(self, action: #selector(backSegue) )
        swipeLeft.direction = .left
        self.view!.addGestureRecognizer(swipeLeft)
        
    }

    @IBAction func unWindToLeagues(segue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func backSegue() {
        performSegue(withIdentifier: "unWindToSport", sender: self)
    }
    
    func setLeagues(list: [League]) {
        print("######## loaded leagues size ######### \(list.count)")
        self.leagues = list
        self.tableView.reloadData()
    }
 
    func setEmpty() {
        print("No leagues!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
         return leagues.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as! LeagueTableViewCell
        let league = leagues[indexPath.row]
        cell.leagueYoutube.image = UIImage(named: "youtube.png")
        cell.leagueName.text = league.name
        if let badge = league.badge {
            cell.leagueBadge.kf.setImage(with: URL(string: badge), placeholder: UIImage(named: "noImagePlaceholder.png"))
        }else{
            
        }
       
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let league = leagues[indexPath.row]
        print("selected !!")
        self.performSegue(withIdentifier: "leagueDetailsSegue", sender: self)
        
        }
        
    

    /// MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let indexPath = self.tableView.indexPathForSelectedRow
        var league : League?
        if let index = indexPath?.row{
            league = self.leagues[index]
        }
        if(segue.identifier == "leagueDetailsSegue"){
            let leagueDetails = segue.destination as! LeaguesDetailsViewController
            
            leagueDetails.league = league
        }
        
}
}





