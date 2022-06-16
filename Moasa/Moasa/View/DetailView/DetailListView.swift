//
//  DetailListView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/11.
//

import SwiftUI

struct DetailListView: View {
    // 아직 Padding 삽입 전 입니다...
    var consumedItem: ConsumedItem
    var leftMoney: Int // 잔액(DetailBlockDateView에서 받아옴) -> Computed Property로 쓸 필요가 있음...
    @EnvironmentObject var items:Items
    var body: some View {
        HStack {
            if let name = consumedItem.consumedName {
                Text(name)
                Text(items.targetItems[0].targetName)
            } else {
                Text("")
            }
            Spacer()
            VStack {
                Text("\(consumedItem.consumedPrice)원")
                    .font(.title3)
                    .foregroundColor(Color("AccentColor"))
                Text("\(leftMoney)원")
                    .foregroundColor(Color.gray)
            }
        }
        .background(Color.white)
    }
}
/*
struct DetailListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailListView()
    }
}
*/
