//
//  MoasaApp.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/10.
//

import SwiftUI

@main
struct MoasaApp: App {
    @Environment(\.managedObjectContext) private var viewContext
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {

                NewInitSettingView() //@AppStorage로 값이 입력된 상태라면, if else 구문으로 들어 갈 예정
                  .environment(\.managedObjectContext, persistenceController.container.viewContext)
//                InitSettingView() //@AppStorage로 값이 입력된 상태라면, if else 구문으로 들어 갈 예정
            }
        }
    }
}
