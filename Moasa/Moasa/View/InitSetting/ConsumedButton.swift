//
//  ConsumedButton.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/18.
//

import SwiftUI

struct ConsumedButton: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var items: Items

    @Binding var consumedCategories: [ConsumedCategory]
    @Binding var consumedLimitValues: [Int]
    @Binding var addArray: Int
    @Binding var showList: Bool
    @Binding var nextView: Bool?
    @Binding var fixedSaving: Int
    @Binding var btnText: [String]

    var body: some View {
        VStack {
// 아래부터 역순으로 Component 생성
// 전체 완료 버튼: 소비항목 저장 및 메인뷰 이동
            if addArray > 2 && showList {
                NavigationLink(destination: MainView().environmentObject(items), tag: true, selection: $nextView) {
                    EmptyView()
                }

                Button(action: {
                    // 1. 입력된 카텓고리의 모든 이름이 빈 문자열이 아니다.
                    // 2. 입력된 카테고리의 모든 가격이 0 초과다.
                    let categoryNameCheck = consumedCategories.filter { $0.consumedCategory.isEmpty }
                    let consumedLimitCheck = consumedLimitValues.filter { $0 <= 0 }

                    if categoryNameCheck.isEmpty && consumedLimitCheck.isEmpty {
                        withAnimation {
                            for idx in 0..<consumedCategories.count {
                                consumedCategories[idx].consumedLimit[0] = consumedLimitValues[idx]
                            }
                            items.consumedCategories = consumedCategories
                            print(consumedCategories[0].consumedLimit)
                            print(consumedCategories[1].consumedLimit)
                            UserDefaults.standard.set(true, forKey: "initSetting")
                        }
                        nextView = true
                    } else {
                        // ALERT "이상한 정보입니다."
                    }
                }, label: {
                    BtnShape(btnText: $btnText[1])
                })
// 고정저금액 버튼: 소비항목 리스트 호출
            } else if self.fixedSaving >= 0 {
                // 예산항목 추가를 보여주는 버튼
                Button(action: {
                    showList = true
                    hideKeyboard()
                }, label: {
                    BtnShape(btnText: $btnText[0])
                })
                .opacity(self.fixedSaving > 0 ? 1: 0)
            }
        }
    }
}
