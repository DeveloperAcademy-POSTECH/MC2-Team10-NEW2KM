//
//  ConsumedLimitView.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/14.
//

import SwiftUI


struct Categories: View {
    @Binding var consumedCategory: String

    var body: some View {
        VStack {
            TextField("기타", text: $consumedCategory)
            Divider()
                .background(Color.accentColor)
        }
    }
}

struct Limits: View {
    @Binding var consumedLimit: Int

    var body: some View {
        VStack {
            HStack {
                TextField("100_000", value: $consumedLimit, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
                Text("원")
                    .font(.system(size: 17, weight: .regular))
                    .padding(.trailing, 16)
            }
            Divider()
                .background(Color.accentColor)
        }
    }
}

struct ConsumedCategories: View {

    @Binding var consumedCategory: String
    @Binding var consumedLimit: Int

    var body: some View {
        HStack {
            VStack {
                TextField("기타", text: $consumedCategory)
                    .font(.system(size: 17, weight: .regular))
                    .lineSpacing(0)
                Divider()
                    .background(Color.accentColor)
            }
            VStack {
                HStack {
                    TextField("100_000", value: $consumedLimit, formatter: NumberFormatter())
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

struct TestArray: Hashable {
    var test1: String
    var test2: Int
}

struct ConsumedLimitView: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var items: Items

    

    @State var consumedCategories = ["식비", "교통/차량", "패션/미용"]
    @State var consumedLimits = [500_000, 100_000, 200_000]

    @State var consumedCategoryArray = [""]
    @State var consumedLimitArray = [0]

    @State var consumedCategory = ""
    @State var consumedLimit: Int = 0
    @State var addCategory = false
    @State var addArray: Int = 1

    @State var showList = false
    @State var nextView: Bool? = false

    @State private var fixedSaving = 1
    @State var btnText: [String] = ["확인", "입력 완료"]

    var body: some View {
        NavigationView {
            VStack {
                if showList {
                    HStack {
                        Text("예산 항목을 추가해주세요")
                            .font(.system(size: 25, weight: .semibold))
                            .padding(.top, 90)
                            .padding(.bottom, 40)
                        Spacer()
                    }.padding(.leading, 16)

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
                        VStack {
                            if addArray > 0 {
                                VStack {
                                    ForEach(0..<addArray, id: \.self) { idx in
                                        HStack {
                                            Categories(consumedCategory: self.$consumedCategoryArray[idx])
                                            Limits(consumedLimit: self.$consumedLimitArray[idx])
                                        }
                                    }
                                }
                            }
                            ConsumedCategories(consumedCategory: $consumedCategories[0],
                                               consumedLimit: $consumedLimits[0]) // 식비(Default)
                            ConsumedCategories(consumedCategory: $consumedCategories[1],
                                               consumedLimit: $consumedLimits[1]) // 교통/차량(Default)
                            ConsumedCategories(consumedCategory: $consumedCategories[2],
                                               consumedLimit: $consumedLimits[2]) // 패션/미용(Default)
                            ConsumedCategory(consumedCategory: "food", consumedLimit: [0:consumedLimit])
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 40)
                    })
                }

                if self.fixedSaving >= 0 {
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
// 예산항목 추가를 보여주는 버튼
                    Button(action: {
                        showList = true
                    }, label: {
                        BtnShape(btnText: $btnText[0])
                    })
                    .disabled(self.fixedSaving > 0 ? false : true)
                    .opacity(self.showList ? 0: 1)
                } else if addArray > 0 {
                    NavigationLink(destination: MainView(), tag: true, selection: $nextView) {
                        EmptyView()
                    }

                    Button(action: {
                        withAnimation {
                            let newCategory = ConsumedCategory(consumedCategory: consumedCategory,
                                                               consumedLimit: [0: consumedLimit])
                            @State consumedCategories:[ConsumedCategory] = [식비, 교통비, 의류 등]
                            
                            items.consumedCategories = consumedCategories
                            items.consumedCategorySaved()
                            items.consumedCategories.append(newCategory)
                            items.consumedCategorySaved()
                            UserDefaults.standard.set(true, forKey: "initSetting")
                        }
                        nextView = true
                    }, label: {
                        BtnShape(btnText: $btnText[1])
                    })
                }
            }
            .background(Color.kenCustomOrange)
            .navigationBarHidden(true)
        }
        .background(Color.kenCustomOrange)
    }
    func addElement() {
        consumedCategoryArray.insert("", at: 0)
        consumedLimitArray.insert(0, at: 0)
    }
}
struct ConsumedLimitView_Previews: PreviewProvider {
    static var previews: some View {
        ConsumedLimitView()
    }
}
