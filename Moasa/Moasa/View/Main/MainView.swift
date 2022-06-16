//
//  MainView.swift
//  Moasa
//
//  Created by 김원희 on 2022/06/11.
//

import CoreData
import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color("KellyCustomGray").ignoresSafeArea()
            VStack {
                MainTitleView()
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                ScrollView {
                    TargetContentView()
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 39, trailing: 0))
                    BudgetContentView()
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
