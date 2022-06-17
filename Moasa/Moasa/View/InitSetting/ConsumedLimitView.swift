//
//  ConsumedLimitView.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/14.
//

import SwiftUI

struct ConsumedLimitView: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var items: Items

    @State var consumedCategories = [ConsumedCategory(consumedCategory: "식비", consumedLimit: [:]),
                                     ConsumedCategory(consumedCategory: "교통/차량", consumedLimit: [:]),
                                     ConsumedCategory(consumedCategory: "패션/미용", consumedLimit: [:]),
                                     ConsumedCategory(consumedCategory: "생활용품", consumedLimit: [:])]
    @State var consumedLimitValues = [0, 0, 0, 0]

    @State var consumedLimitStr = ["", "", "", ""]
    @State var addArray: Int = 3
    @State var showList = false
    @State var nextView: Bool? = false

    @State var fixedSaving: Int = 0
    @State var text: String = ""
    @State var btnText: [String] = ["확인", "입력 완료"]

    var body: some View {
        VStack {
            HStack {
                Text("예산을 입력해주세요")
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.top, 90)
                    .padding(.bottom, 40)
                Spacer()
            }.padding(.leading, 16)
// Component - 소비 항목 입력 컴포넌트
            ConsumedInput(consumedCategories: $consumedCategories, consumedLimitValues: $consumedLimitValues,
                          showList: $showList, consumedLimitStr: $consumedLimitStr,
                          addArray: $addArray, text: $text,
                          fixedSaving: $fixedSaving)
            .environmentObject(items)
// Component - 저장, 네비게이션 버튼
            ConsumedButton(consumedCategories: $consumedCategories, consumedLimitValues: $consumedLimitValues,
                           addArray: $addArray, showList: $showList, nextView: $nextView,
                           fixedSaving: $fixedSaving, btnText: $btnText)
            .environmentObject(items)
        }
        .background(Color.kenCustomOrange)
        .navigationBarHidden(true)
        .onTapGesture {
            hideKeyboard()
        }
    }
}
struct ConsumedLimitView_Previews: PreviewProvider {
    static var previews: some View {
        ConsumedLimitView()
    }
}
