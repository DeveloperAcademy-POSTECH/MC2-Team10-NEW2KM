//
//  ConsumedInput.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/18.
//

import SwiftUI

struct ConsumedInput: View {
    @Binding var consumedCategories: [ConsumedCategory]
    @Binding var consumedLimitValues: [Int]

    @Binding var showList: Bool
    @Binding var consumedLimitStr: [String]
    @Binding var addArray: Int
    @Binding var text: String
    @Binding var fixedSaving: Int

    var body: some View {
// 아래부터 역순으로 호출
// Component - 소비항목 리스트 입력
        if showList {
            Section(header: HStack {
                Text("소비 예산을 설정해주세요")
                Spacer()
                Button(action: {
                    self.addArray += 1
                    addElement()
                    consumedLimitStr.append("")
                    consumedLimitValues.append(0)
                    hideKeyboard()
                }, label: {
                    Image(systemName: "plus")
                })
            }
                .font(.system(size: 20, weight: .bold))
                .padding(.horizontal, 16), content: {
                        if addArray > 0 {
                            List {
                                ForEach(0..<consumedCategories.count, id: \.self) { idx in
                                    HStack {
                                        VStack {
                                            TextField("기타", text: $consumedCategories[idx].consumedCategory)
                                                .font(.system(size: 17, weight: .regular))
                                                .disableAutocorrection(true)
                                            Divider()
                                                .background(Color.accentColor)
                                        }
                                        VStack {
                                            TextField("0", text: $consumedLimitStr[idx])
                                                .onChange(of: consumedLimitStr[idx]) {newValue in
                                                    consumedLimitValues[idx] = Int(newValue)!
                                                }
                                                .keyboardType(.numberPad)
//                                            .padding(.trailing, 16)

//                                                TextField("100000", value: $consumedLimitValues[idx],
//                                                          formatter: NumberFormatter())
//                                                    .keyboardType(.numberPad)
//                                                    .padding(.trailing, 16)
                                            Divider()
                                                .background(Color.accentColor)
                                        }
                                        Text("원")
                                            .font(.system(size: 17, weight: .regular))
                                    }
                                }
                                .onDelete(perform: delete)
                                .listRowBackground(Color.kenCustomOrange)
                                .listRowInsets(EdgeInsets())
                                .listRowSeparator(.hidden)
                                .background(Color.kenCustomOrange)
                            }
                            .onAppear { UITableView.appearance().backgroundColor = UIColor.clear }
                    }
                })
        }

// Component - 고정 저금액 입력
        HStack {
            Text("목표를 위해 매 월 얼마까지 모을 수 있나요?")
                .font(.system(size: 20, weight: .bold))
            Spacer()
        }.padding(.leading, 16)

        VStack {
            HStack {
                TextField("월 저축액을 입력해주세요.", text: $text)
                    .onChange(of: text) {newValue in
                        fixedSaving = Int(newValue)!
                    }
                    .padding(.leading, 16)
                    .font(.system(size: 17, weight: .regular))
                    .keyboardType(.numberPad)
                Text("원")
                    .font(.system(size: 17, weight: .regular))
                    .padding(.trailing, 16)
            }
            Divider()
                .background(Color.accentColor)
                .padding(.horizontal, 16)
                .padding(.trailing, 20)
                .padding(.bottom, 20)
        }
        Spacer()
    }
    func addElement() {
        consumedCategories.append(ConsumedCategory(consumedCategory: "", consumedLimit: [:]))
    }
    func delete(offset: IndexSet) {
        withAnimation {
            consumedCategories.remove(atOffsets: offset)
            consumedLimitValues.remove(atOffsets: offset)
        }
    }
}
