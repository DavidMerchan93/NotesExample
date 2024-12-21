//
//  NotesExampleApp.swift
//  NotesExample
//
//  Created by David Merchan on 21/12/24.
//

import SwiftUI

@main
struct NotesExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
