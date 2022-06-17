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

    @State var consumedCategories = [ConsumedCategory(consumedCategory: "식비", consumedLimit: [0: 500_000]),
                                     ConsumedCategory(consumedCategory: "교통/차량", consumedLimit: [0: 100_000]),
                                     ConsumedCategory(consumedCategory: "패션 미용", consumedLimit: [0: 200_000])]
    // TODO: 1. consumedLimit 키 값에 대한 한계 비용 바꾸기
    // TODO: 2 식비 -> food로 저장 변환

    @State var consumedCategoryArray = ["식비", "교통/차량", "패션/미용"]
    @State var consumedLimitArray = [0, 0, 0]

    @State var consumedCategory = ""
    @State var consumedLimit = 0
    @State var addCategory = false
    @State var addArray: Int = 2

    @State var showList = false
    @State var nextView: Bool? = false

    @State var fixedSaving = 0
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
            if showList {
                    Section(header: HStack {
                        Text("소비 예산을 설정해주세요")
                        Spacer()
                        Button(action: {
                            self.addArray += 1
                            addElement()
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                        .font(.system(size: 20, weight: .bold))
                        .padding(.horizontal, 16), content: {
                            ScrollView {
                                VStack {
                                    if addArray > 0 {
                                        ForEach(0..<consumedCategories.count, id: \.self) { idx in
                                            HStack {
                                                ConsumedCategories(consumedCategory: self.$consumedCategories[idx])
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal, 16)
                                .padding(.bottom, 40)
                            }
                        })
            }
            HStack {
                Text("목표를 위해 매 월 얼마까지 모을 수 있나요?")
                    .font(.system(size: 20, weight: .bold))
                Spacer()
            }.padding(.leading, 16)

            HStack {
                TextField("예시: " + numberFormatter(number: 100_000),
                          value: $fixedSaving, formatter: NumberFormatter())
                .padding(.leading, 16)
                .font(.system(size: 17, weight: .regular))
                .keyboardType(.decimalPad)
                Text("원")
                    .font(.system(size: 17, weight: .regular))
                    .padding(.trailing, 16)
            }
            Divider()
                .background(Color.accentColor)
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            Spacer()

            VStack {
                if addArray > 2 && showList {
                    NavigationLink(destination: MainView().environmentObject(items), tag: true, selection: $nextView) {
                        EmptyView()
                    }

                    Button(action: {
                        withAnimation {
                            items.consumedCategories = consumedCategories
                            UserDefaults.standard.set(true, forKey: "initSetting")
                        }
                        nextView = true
                    }, label: {
                        BtnShape(btnText: $btnText[1])
                    })
                } else if self.fixedSaving >= 0 {
// 예산항목 추가를 보여주는 버튼
                    Button(action: {
                        showList = true
                    }, label: {
                        BtnShape(btnText: $btnText[0])
                    })
                    .opacity(self.fixedSaving > 0 ? 1: 0)
                }
            }
        }
        .background(Color.kenCustomOrange)
        .navigationBarHidden(true)
        .onTapGesture {
            hideKeyboard()
        }
    }
    func addElement() {
//        consumedCategoryArray.insert("", at: 0)
//        consumedLimitArray.insert(0, at: 0)
        consumedCategories.append(ConsumedCategory(consumedCategory: "", consumedLimit: [0:100000]))
    }
}
struct ConsumedLimitView_Previews: PreviewProvider {
    static var previews: some View {
        ConsumedLimitView()
    }
}


struct ConsumedCategories: View {
    @Binding var consumedCategory: ConsumedCategory
//    @Binding var consumedLimit: ConsumedCategory

    var body: some View {
        HStack {
            VStack {
                TextField("기타", text: $consumedCategory.consumedCategory)
                    .font(.system(size: 17, weight: .regular))
                    .lineSpacing(0)
                Divider()
                    .background(Color.accentColor)
            }
            VStack {
                HStack {
                    TextField("100_000", value: $consumedCategory.consumedLimit[0], formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                    Text("원")
                        .font(.system(size: 17, weight: .regular))
                }
                .lineSpacing(0)
                .padding(.trailing, 16)
                Divider()
                    .background(Color.accentColor)
            }
        }
    }
}


//struct Categories: View {
//    @Binding var consumedCategory: String
//
//    var body: some View {
//        VStack {
//            TextField("기타", text: $consumedCategory)
//            Divider()
//                .background(Color.accentColor)
//        }
//    }
//}
//
//struct Limits: View {
//    @Binding var consumedLimit: Int
//
//    var body: some View {
//        VStack {
//            HStack {
//                TextField("100000", value: $consumedLimit, formatter: NumberFormatter())
//                    .keyboardType(.decimalPad)
//                Text("원")
//                    .font(.system(size: 17, weight: .regular))
//                    .padding(.trailing, 16)
//            }
//            Divider()
//                .background(Color.accentColor)
//        }
//    }
//}
