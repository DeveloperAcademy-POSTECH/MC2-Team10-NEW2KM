//
//  MainView.swift
//  Moasa
//
//  Created by 김원희 on 2022/06/11.
//

import CoreData
import SwiftUI

struct MainView: View {
    @EnvironmentObject var items: Items
    let targetItemMock1 = TargetItem(targetName: "Will", targetPrice: 10, fixedSaving: 100)
    var body: some View {
        ZStack {
            Color("KellyCustomGray").ignoresSafeArea()
            VStack {
                Button(action: {
                    items.targetItemSaved(encodedData: [TargetItem(targetName: "WILL", targetPrice: 10, fixedSaving: 400)])
//                    items.load()
                }, label: {
                    Text("안됩니다!")
                })
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

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            MainView(targetItem: <#FetchedResults<TargetItem>#>)
//        }
//    }
//}
