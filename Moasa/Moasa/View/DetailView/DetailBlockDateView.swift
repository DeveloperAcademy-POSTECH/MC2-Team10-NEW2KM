//
//  DetailBlockDateView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/12.
//

import SwiftUI

struct DetailBlockDateView: View {
    @EnvironmentObject var items: Items
    var consumedItemsSorted: [ConsumedItem]
    // 해당 카테고리의 모든 ConsumedItem 정렬된 상태 (값)
    var date: Date
    var body: some View {
        VStack {
            List { // ForEach 수정 필요 (구조 확정되면...)
                Section(header: Text(dateFormatter(date: date))) {
                    ForEach(consumedItemsSorted) { item in
                        DetailListView(consumedItem: item, leftMoney: 5000)
                        // TODO: leftMoney -> 해당 카테고리의 해당 월별 한계 금액 - 해당 금액까지 누적 금액 뺀 것
                    }
                }
            }
        }
    }
}
