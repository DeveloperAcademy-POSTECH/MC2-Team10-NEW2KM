//
//  DetailPriceListView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/17.
//

import SwiftUI

struct DetailPriceListView: View {
    @EnvironmentObject var items: Items
    var consumedItem: ConsumedItem
    var leftMoney: Int
    var body: some View {
        HStack {
            Text(dateFormatter(date: consumedItem.consumedDate, format:"MM월 dd일"))
            if let name = consumedItem.consumedName {
                Text(name)
            } else {
                Text("")
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 10) {
                Text("\(consumedItem.consumedPrice)원")
                    .font(.title3)
                    .foregroundColor(Color("AccentColor"))
                Text("\(leftMoney)원")
                    .foregroundColor(Color.gray)
            }
        }
        .padding(.horizontal)
        .background(Color.white)
    }
}
