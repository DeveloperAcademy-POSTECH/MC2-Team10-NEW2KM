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
            NavigationView {
                NewInitSettingView()
//                InitSettingView() //@AppStorage로 값이 입력된 상태라면, if else 구문으로 들어 갈 예정
//                MainView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
