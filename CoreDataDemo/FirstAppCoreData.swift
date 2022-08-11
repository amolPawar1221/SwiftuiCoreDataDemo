//
//  FirstAppCoreData.swift
//  CoreDataDemo
//
//  Created by Amol Pawar on 24/07/22.
//

import CoreData

class FirstAppCoreData {
    var persistentContainer: NSPersistentContainer

    init() {
        persistentContainer = NSPersistentContainer(name: "FirstApp")
        persistentContainer.loadPersistentStores { des, erro in
            if erro == nil {
                print("done")
            }
        }
    }
}

