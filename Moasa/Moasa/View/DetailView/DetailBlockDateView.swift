//
//  DetailBlockDateView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/12.
//

import SwiftUI

struct DetailBlockDateView: View {
    var consumedCategory: ConsumedCategory // DetailView에서 이미 filter를 거치고 들어온 데이터여야 합니다.
    var body: some View {
        VStack {
            List { // ForEach 수정 필요 (구조 확정되면...)
                ForEach(0..<consumedCategory.consumedItems.count) { idx in
                    DetailListView(consumedItem: consumedCategory.consumedItems[idx], leftMoney: 5000)
                }
            }
        }
    }
}

struct DetailBlockDateView_Previews: PreviewProvider {
    static var previews: some View {
        DetailBlockDateView()
    }
}
