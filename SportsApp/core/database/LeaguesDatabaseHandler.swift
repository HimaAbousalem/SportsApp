//
//  LeaguesDatabaseHandler.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/21/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
import CoreData

class LeaguesDatabaseHandler{
    var manageContext: NSManagedObjectContext?
    var appDelegate: AppDelegate?
    private static var localInstance: LeaguesDatabaseHandler?
    
    private init (appDelegate:AppDelegate){
        self.appDelegate = appDelegate
        self.manageContext = appDelegate.persistentContainer.viewContext
    }
    
    static func initaliaze(appDelegate: AppDelegate){
        localInstance = LeaguesDatabaseHandler(appDelegate: appDelegate)
    }
    
    static func getInstance() -> LeaguesDatabaseHandler {
        return localInstance!
    }
    
    func saveLocalLeague(leagueObject:League){
        guard let entity = NSEntityDescription.entity(forEntityName: "LocalLeague",in: manageContext!)else{
            fatalError("Couldn't find entity discription!")
        }
        let savedLeague = LocalLeague(entity: entity, insertInto: manageContext)
        
        savedLeague.setValue(leagueObject.id, forKey: "leagueId")
        savedLeague.setValue(leagueObject.badge, forKey: "leagueImage")
        savedLeague.setValue(leagueObject.name, forKey: "leagueName")
        savedLeague.setValue(leagueObject.youtube, forKey: "leagueYoutube")
        
        do{
            try manageContext?.save()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    func getLocalLeagues()->[League]{
        var localLeagues = [LocalLeague]()
        let fetchRequest = NSFetchRequest<LocalLeague>(entityName: "LocalLeague")
        do{
            localLeagues = try manageContext!.fetch(fetchRequest)
        }
        catch{
            print("error in fetch localLeagues")
        }
        return LeaguesListMapper(localLeagues: localLeagues)
    }
    
    func fetchLeaguesById(id: String)-> NSManagedObject?{
        var league = [NSManagedObject]()
        let predicate = NSPredicate(format: "leagueId ==%@", id)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LocalLeague")
        fetchRequest.predicate = predicate
        do{
            league = try manageContext!.fetch(fetchRequest)
        }catch{
            print("Error in fetch league data")
        }
        if(league.count > 0){
            return league[0]
        }
        return nil
    }
    
    func deleteLeague(id: String){
        let leagueObject = fetchLeaguesById(id: id)
        if(leagueObject != nil){
            manageContext?.delete(leagueObject!)
            do{
                try manageContext?.save()
            }catch{
                print("Error in delete League")
            }
        }
    }
    
    func isFavourite(id: String)-> Bool{
        return fetchLeaguesById(id: id) != nil ? true : false
    }
    
    func LeaguesObjectMapper(localLeague: LocalLeague?)->League?{
        if localLeague != nil{
            return League(id: (localLeague?.leagueId)!, name: (localLeague?.leagueName)!, sport: "", youtube: (localLeague?.leagueYoutube!)!, badge: (localLeague?.leagueImage!)!)
        }
        return nil
    }
    
    func LeaguesListMapper(localLeagues: [LocalLeague])->[League]{
        var leagues = [League]()
        for league in localLeagues{
            leagues.append(League(id: league.leagueId!, name: league.leagueName!, sport: "", youtube: league.leagueYoutube ?? "", badge: league.leagueYoutube ?? ""))
        }
        return leagues
    }
}
