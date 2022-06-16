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
//struct AmountCategories: View {
//    var consumedCategory: String
//    var consumedAmount: Int
//
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .foregroundColor(.white)
//                .background(.white)
//            HStack {
//                Text(consumedCategory)
//                Spacer()
//                Text(String(numberFormatter(number: consumedAmount)))
//            }
//            .font(.system(size: 15, weight: .regular))
//            .padding(.vertical, 16)
//            .padding(.horizontal, 16)
//        }
//        .frame(width: 350, height: 100)
//        .cornerRadius(13)
//    }
//}
//
//struct ConsumedLimitView: View {
//    @Environment(\.managedObjectContext) var viewContext
//
//    var consumedCategories = [ConsumedCategories(consumedCategory: "식비", consumedAmount: 100_000),
//                              ConsumedCategories(consumedCategory: "교통/차량", consumedAmount: 200_000),
//                              ConsumedCategories(consumedCategory: "패션/미용", consumedAmount: 300_000)]
//    var consumedCategory: [String] = ["식비", "교통비", "쇼핑"]
//    var consumedAmount: [Int] = [100_000, 200_000, 300_000]
//    @State var fixedSaving: String = ""
//    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    Text("예산  항목을 추가해주세요")
//                        .font(.system(size: 25, weight: .semibold))
//                        .padding(.top, 90)
//                        .padding(.bottom, 40)
//                    Spacer()
//                }.padding(.leading, 16)
//
//                Text("목표를 위해 매 월 얼마까지 모을 수 있나요?")
//                    .font(.system(size: 20, weight: .bold))
//                HStack {
//                    TextField("예시: " + numberFormatter(number: 100_000), text: self.$fixedSaving)
//                        .padding(.leading, 16)
//                        .font(.system(size: 17, weight: .regular))
//                        .keyboardType(.decimalPad)
//                    Text("원")
//                        .font(.system(size: 17, weight: .bold))
//                        .padding(.trailing, 16)
//                }
//                Divider()
//                    .background(Color.accentColor)
//                    .padding(.horizontal, 16)
//                    .padding(.bottom, 20)
//                Section(header: HStack {Text("소비 예산을 설정해주세요")
//                    Spacer()}.font(.system(size: 20, weight: .bold))
//.padding(.horizontal, 16)
//                        , content: {
//                    ForEach(consumedCategories, id: \.self) { category in
//                        AmountCategories(consumedCategory: category.consumedCategory,
//                                         consumedAmount: category.consumedAmount)
//                    }
//                    .frame(width: 350, height: 50)
//                            .cornerRadius(13)
//                    Button(action: {
//// 항목 추가
//                    }, label: {
//                        ZStack {
//                            Rectangle()
//                                .foregroundColor(.white)
//                                .background(.white)
//                            Image(systemName: "plus")
//                                .font(.system(size: 25, weight: .bold))
//                        }
//                        .frame(width: 350, height: 50)
//                        .cornerRadius(13)
//                        .padding(.horizontal, 16)
//                    })
//                    Spacer()
//                })
//                NavigationLink(destination: ContentView(), label: {
//                    Button(action: {
//// 저장하기
//                    }, label: {
////                        ZStack {
////                            Rectangle()
////                                .frame(width: 360, height: 60)
////                                .cornerRadius(13)
////                                .foregroundColor(.accentColor)
////                            Text("입력 완료")
////                                .foregroundColor(.white)
////                                .font(.system(size: 20, weight: .bold))
////                        }
//                    })
//                    ZStack {
//                        Rectangle()
//                            .frame(width: 360, height: 60)
//                            .cornerRadius(13)
//                            .foregroundColor(.accentColor)
//                        Text("입력 완료")
//                            .foregroundColor(.white)
//                            .font(.system(size: 20, weight: .bold))
//                    }
//                })
//            }
//            .background(Color.kenCustomOrange)
//            .navigationBarHidden(true)
//        }
//    }
//}
//
//struct ConsumedLimitView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConsumedLimitView()
//    }
//}
