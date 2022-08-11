//
//  Details+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Amol Pawar on 24/07/22.
//
//

import Foundation
import CoreData


extension Details {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Details> {
        return NSFetchRequest<Details>(entityName: "Details")
    }

    @NSManaged public var userName: String?
    @NSManaged public var desc: String?

}

extension Details : Identifiable {

}
