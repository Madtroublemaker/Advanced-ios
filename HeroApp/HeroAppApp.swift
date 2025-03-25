//
//  HeroAppApp.swift
//  HeroApp
//
//  Created by Madina Abdulgafar on 20.03.2025.
//

import SwiftUI

@main
struct HeroAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


