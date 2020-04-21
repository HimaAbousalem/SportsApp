//
//  LocalLeague+CoreDataProperties.swift
//  
//
//  Created by Esraa Hassan on 4/21/20.
//
//

import Foundation
import CoreData


extension LocalLeague {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocalLeague> {
        return NSFetchRequest<LocalLeague>(entityName: "LocalLeague")
    }

    @NSManaged public var leagueId: String?
    @NSManaged public var leagueImage: String?
    @NSManaged public var leagueName: String?
    @NSManaged public var leagueYoutube: String?

}
