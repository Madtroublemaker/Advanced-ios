//
//  WeatherAPPApp.swift
//  WeatherAPP
//
//  Created by Madina Abdulgafar on 11.04.2025.
//

import SwiftUI

@main
struct WeatherAPPApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
