//
//  ppaApp.swift
//  ppa
//
//  Created by Alexander Gorenkov on 24.12.2023.
//

import SwiftUI

@main
struct ppaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
