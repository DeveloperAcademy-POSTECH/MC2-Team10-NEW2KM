//
//  DetailView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/13.
//

import HalfASheet
import SwiftUI

struct DetailView: View {
    @EnvironmentObject var items: Items
    @State var selectedMethod = false // false => 기간순, true => 가격순
    @State var startDate: Date = addDate(date: Date(), days: -30)
    @State var endDate = Date() // Default Value 주고 나중에 DatePicker로 값 변경했을때 값 바꾸는게 좋을듯 싶습니다. ㅇㅈㅇㅈ
    @State var isShowing = false
    @State private var showModal = false
    var category: Items.CategoryLeft
    // false -> 최신 (자동) true -> 가격
    // Date (연, 월, 일) -> (일 단위 기준)
    // 디폴트: start <-> end까지의 소비 기록을 뽑을 커팅 포인트
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .center) {
                    WaveView(progress: items.balancePercent(categoryName: category.category), category: category).environmentObject(items)
                    SearchBarView(isShowing: $isShowing)
                    if items.consumedItems.isEmpty {
                        DetailNothing()
                    } else {
                        if selectedMethod { // 가격순 정렬
                            let filteredItems = items.sortbyPrice(categoryName: category.category,
                                                                  startDate: startDate, endDate: endDate)
                            ForEach(filteredItems) { block in
                                DetailPriceListView(consumedItem: block, leftMoney: 5000).environmentObject(items)
                                    .padding()
                                Divider()
                            }
                        } else { // 기간순 정렬
                            let filteredItems = items.sortbyDate(categoryName: category.category,
                                                                 startDate: startDate, endDate: endDate)
                            ForEach(filteredItems) { block in
                                DetailPriceListView(consumedItem: block, leftMoney: 5000).environmentObject(items)
                                    .padding()
                                Divider()
                            }
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            HalfASheet(isPresented: $isShowing) {
                VStack {
                    VStack {
                        Text("소비내역정렬")
                        Spacer()
                        HStack {
                            Picker("피커", selection: $selectedMethod) {
                                Text("기간순")
                                Text("가격순")
                            }
                        }
                        Spacer()
                    }
                    Divider()
                    VStack {
                        Text("기간")
                        Spacer()
                        HStack {
                            Spacer()
                            DatePicker(selection: $startDate,
                                       displayedComponents: .date, label: {})
                            .labelsHidden()
                            Text("~")
                            DatePicker(selection: $endDate,
                                       displayedComponents: .date, label: {})
                            .labelsHidden()
                            Spacer()
                        }
                        Spacer()
                        Button("확인") {
                            if isShowing {
                                isShowing.toggle()
                            }
                        }
                    }
                }
            }
            .backgroundColor(.white)
            .height(.proportional(0.5))
            .closeButtonColor(.orange)
        }
        .navigationBarTitle(category.category, displayMode: .inline)
        .navigationBarItems(trailing: Button("Add", action: { self.showModal.toggle() }))
        .sheet(isPresented: self.$showModal) {
            DetailInputView(consumCategory: category.category, consumName: "", consumPrice: 0)
        }
    }
}
