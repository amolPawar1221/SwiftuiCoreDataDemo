//
//  CoreDataDemoApp.swift
//  CoreDataDemo
//
//  Created by Amol Pawar on 24/07/22.
//

import SwiftUI

@main
struct CoreDataDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, FirstAppCoreData().persistentContainer.viewContext)
        }
    }
}
