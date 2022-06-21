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
    @StateObject var items: Items = Items()
    // 초기 세팅 필요 시 NewInitSettingView
    // 린트 해결위해 타입선언 삭제할 것
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
