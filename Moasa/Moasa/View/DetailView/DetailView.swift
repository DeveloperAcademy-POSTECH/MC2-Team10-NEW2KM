//
//  DetailView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/13.
//

import SwiftUI

struct DetailView: View {
    // MARK: 여기의 주석은 CoreData연결 이후에 주석을 제거한다. 디테일 뷰를 확인할 수 없음
    @EnvironmentObject var items: Items
    @State var selectedMethod: Bool = false
    @State var startDate: Date
    @State var endDate: Date
    var category: Items.CategoryLeft
    var body: some View {
        VStack {
            CircleWaveView(percent: items.balancePercent(categoryName: category.category))
            SearchBarView()
        }
    }
}

// struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(
//    }
// }
