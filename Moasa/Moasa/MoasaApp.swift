//
//  MoasaApp.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/10.
//

import SwiftUI

@main
struct MoasaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            InitSettingView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
