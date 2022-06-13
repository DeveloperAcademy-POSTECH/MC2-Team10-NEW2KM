//
//  DetailView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/13.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        // Logic >>> sort, filter, etc...
        
        VStack {
            CircleWaveView(percent: 100)
            // SearchBarView()
            /*
            VStack { // ForEach 수정해야합니다 꼭...
                LazyVStack {
                    List {
                        ForEach(0..<consumedCategory.consumedItems.count) { idx in
                            DetailListView(consumedItem: consumedCategory.consumedItems[idx], leftMoney: 5000)
                        }
                    }
                }
            }
            */
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
