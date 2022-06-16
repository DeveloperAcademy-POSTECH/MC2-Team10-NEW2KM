////
////  ConsumedLimitView.swift
////  Moasa
////
////  Created by 지준용 on 2022/06/14.
////
//
//import SwiftUI
//
//struct ConsumedCategories: Hashable {
//    var consumedCategory: String
//    var consumedAmount: Int
//}
//
import SwiftUI

struct BtnShape: View {
    @Binding var btnText: String

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 360, height: 60)
                .cornerRadius(13)
                .foregroundColor(.accentColor)
            Text(btnText)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
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
                Divider()
                    .background(Color.accentColor)
            }
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
}

struct TestArray: Hashable {
    var test1: String
    var test2: Int
}

struct ConsumedLimitView: View {
    @Environment(\.managedObjectContext) var viewContext

    @State var consumedCategories = ["식비", "교통/차량", "패션/미용"]
    @State var consumedLimits = [500_000, 100_000, 200_000]

    @State var consumedCategoryArray = ["기타", "기타", "기타", "기타", "기타", "기타", "기타"]
    @State var consumedLimitArray = [0, 0, 0, 0, 0, 0, 0]

    @State var consumedCategory = ""
    @State var consumedLimit: Int = 0
    @State var addCategory = false
    @State var addArray: Int = 0

    @State var showList = false
    @State var nextView: Bool? = false

    @State private var fixedSaving = 0
    @State var btnText: [String] = ["확인", "입력 완료"]

    var testArray = [TestArray(test1: "", test2: 0),
                     TestArray(test1: "", test2: 0)]

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
                            .font(.system(size: 20, weight: .bold))
                        Spacer()
                        Button(action: {
                            self.addArray += 1
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }.padding(.horizontal, 16), content: {
// 어떻게 해야 버튼을 누르면 7개가 차근차근 생길까
                        VStack {
                            if addArray < 7 {
                                ConsumedCategories(consumedCategory: $consumedCategoryArray[addArray],
                                                   consumedLimit: $consumedLimitArray[addArray])
                            }
                            ConsumedCategories(consumedCategory: $consumedCategories[0],
                                               consumedLimit: $consumedLimits[0]) // 식비(Default)
                            ConsumedCategories(consumedCategory: $consumedCategories[1],
                                               consumedLimit: $consumedLimits[1]) // 교통/차량(Default)
                            ConsumedCategories(consumedCategory: $consumedCategories[2],
                                               consumedLimit: $consumedLimits[2]) // 패션/미용(Default)
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 40)
                    })
                }
// 저장 후 메인뷰 넘어가기
                if consumedCategories.count > 3 && self.fixedSaving > 0 {
                    NavigationLink(destination: MainView(), tag: true, selection: $nextView) {
                        EmptyView()
                    }

                    Button(action: {
                        // 저장기능
                    }, label: {
                        BtnShape(btnText: $btnText[1])
                    })
// 고정 저금액 설정
                } else if self.fixedSaving >= 0 {
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
                }
            }
            .background(Color.kenCustomOrange)
            .navigationBarHidden(true)
        }
        .background(Color.kenCustomOrange)
    }
}
struct ConsumedLimitView_Previews: PreviewProvider {
    static var previews: some View {
        ConsumedLimitView()
    }
}
