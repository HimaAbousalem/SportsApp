//
//  FavouriteTableViewController.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/17/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import UIKit
import Kingfisher

class LeaguesTableViewController: UITableViewController, NextEventView{
//,LeagueView{


    /*var leagues = [League]()
    let presenter = LeaguePresenter(handler: FetchLeaguesHandler())
    let subscriper = LeagueSubscriber()*/
    
    var nextEvents = [Event]()
    let eventPresenter = NextEventPresenter(handler: FetchNextEventsHandler())
    let eventSubscriper = NextEventSubscriber()
    
    /*var latestEvents = [Event]()
    let eventPresenter = LatestEventPresenter(handler: FetchLatestEventsHandler())
    let eventSubscriper = LatestEventSubscriber()
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "leagueCell")
     
        //subscriper.attachView(view: self)
        //presenter.getLeagues()
        
        eventSubscriper.attachView(view: self)
        //eventPresenter.getLatestEvents()
        eventPresenter.getNextEvents()
        
        
    }
    /*func setLeagues(list: [League]) {
        print("######## loaded leagues size ######### \(list.count)")
        self.leagues = list
        self.tableView.reloadData()
    }
    */
    func setNextEvents(list: [Event]) {
        print("######## loaded events size ######### \(list.count)")
        self.nextEvents = list
        self.tableView.reloadData()
    }
    
    /*func setLatestEvents(list: [Event]) {
        print("######## loaded events size ######### \(list.count)")
        self.latestEvents = list
        self.tableView.reloadData()
    }*/
    
    func setEmpty() {
        print("No leagues !")
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
         //return leagues.count
        return nextEvents.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as! LeagueTableViewCell
        
        /*let league = leagues[indexPath.row]
        
        cell.leagueBadge.roundedImage()
        cell.leagueYoutube.image = UIImage(named: "youtube.png")
        cell.leagueName.text = league.name!
        if let badge = league.badge {
            cell.leagueBadge.kf.setImage(with: URL(string: badge))
        }else{
            
        }*/
        let event = nextEvents[indexPath.row]
        if let name = event.name{
            cell.leagueName.text = name
        }else{
            cell.leagueName.text = "not valid"
        }
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.size.height * 0.2;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let league = leagues[indexPath.row]
        print("selected !!")
        
        /*if let videoLink = league.youtube{
            let url = URL(string: videoLink)!
            
         
            }
         */
        
        }
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


