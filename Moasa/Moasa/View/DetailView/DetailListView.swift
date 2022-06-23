//
//  DetailListView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/11.
//

import SwiftUI

struct DetailListView: View {
    var consumedItem: ConsumedItem
    var leftMoney: Int // 잔액(DetailBlockDateView에서 받아옴) -> Computed Property로 쓸 필요가 있음...
    @EnvironmentObject var items: Items
    var body: some View {
        HStack {
            if let name = consumedItem.consumedName {
                Text(name)
            } else {
                Text("")
            }
            Spacer()
            VStack {
                Text("-\(consumedItem.consumedPrice)원")
                    .font(.title3)
                    .foregroundColor(Color("AccentColor"))
                Text("\(leftMoney)원")
                    .foregroundColor(Color.gray)
                Divider()
            }
        }
        .background(Color.white)
    }
}
