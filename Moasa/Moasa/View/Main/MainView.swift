//
//  MainView.swift
//  Moasa
//
//  Created by 김원희 on 2022/06/11.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var items: Items
    let targetItemMock1 = TargetItem(targetName: "Will", targetPrice: 10, fixedSaving: 100)
    var body: some View {
        ZStack {
            Color("KellyCustomGray").ignoresSafeArea()
            VStack {
                MainTitleView()
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    .environmentObject(items)
                ScrollView {
                    TargetContentView()
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 39, trailing: 0))
                            .environmentObject(items)
                    BudgetContentView()
                        .environmentObject(items)
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
