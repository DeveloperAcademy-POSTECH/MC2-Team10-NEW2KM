//
//  MoasaApp.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/10.
//

import SwiftUI

@main
struct MoasaApp: App {
    @AppStorage("initSetting") var initSetting: Bool = UserDefaults.standard.bool(forKey: "initSetting")
    @StateObject var items:Items = Items()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if initSetting {
                    MainView()
                        .environmentObject(items)
                        .onAppear(perform: items.load)
                } else {
                    NewInitSettingView()
                        .environmentObject(items)
                }
            }
        }
    }
}
