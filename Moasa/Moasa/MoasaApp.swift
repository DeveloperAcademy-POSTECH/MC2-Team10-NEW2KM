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
    // 초기 세팅 필요 시 NewInitSettingView
    @StateObject var items: Items = Items()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if initSetting {
                    MainView()
                        .environmentObject(items)
                } else {
                    NewInitSettingView()
                        .environmentObject(items)
                }
            }.onAppear(perform: items.load)
        }
    }
}
