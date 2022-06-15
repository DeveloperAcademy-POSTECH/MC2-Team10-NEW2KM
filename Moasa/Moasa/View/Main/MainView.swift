//
//  MainView.swift
//  Moasa
//
//  Created by 김원희 on 2022/06/11.
//

import CoreData
import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var index = 0
    static var getConsumedCategory: NSFetchRequest<ConsumedCategory> {
        let request: NSFetchRequest<ConsumedCategory> = ConsumedCategory.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \ConsumedCategory.challengeCycle, ascending: true)]
        return request
    }
    @FetchRequest(fetchRequest: getConsumedCategory)
    private var consumedCategory: FetchedResults<ConsumedCategory>

    static var getConsumedItem: NSFetchRequest<ConsumedItem> {
        let request: NSFetchRequest<ConsumedItem> = ConsumedItem.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \ConsumedItem.id, ascending: true)]
        return request
    }
    @FetchRequest(fetchRequest: getConsumedItem)
    private var consumedItems: FetchedResults<ConsumedItem>
    @FetchRequest(
        sortDescriptors:
            [NSSortDescriptor(keyPath: \TargetItem.id, ascending: true)], animation: .default)
    private var targetItem: FetchedResults<TargetItem>

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

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            MainView(targetItem: <#FetchedResults<TargetItem>#>)
//        }
//    }
//}
