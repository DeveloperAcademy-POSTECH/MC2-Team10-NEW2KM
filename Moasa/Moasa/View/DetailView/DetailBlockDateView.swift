//
//  DetailBlockDateView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/12.
//

import SwiftUI

struct DetailBlockDateView: View {
    var consumedItemsSorted: [ConsumedItem]
    // 해당 카테고리의 모든 ConsumedItem 정렬된 상태 (값)
    var sPointer: Int
    var ePointer: Int
    var body: some View {
        VStack {
            List { // ForEach 수정 필요 (구조 확정되면...)
                Section(header: Text(dateFormatter(date: consumedCategory.consumedItems[sPointer].consumedDate))) {
                    ForEach(sPointer..<ePointer) { idx in
                        DetailListView(consumedItem: consumedCategory.consumedItems[idx], leftMoney: 5000)
                    }
                }
            }
        }
    }
}

/*
struct DetailBlockDateView_Previews: PreviewProvider {
    static var previews: some View {
        DetailBlockDateView()
    }
}
*/
