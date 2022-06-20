//
//  InputDetailView.swift
//  Moasa
//
//  Created by 김원희 on 2022/06/13.
//

import SwiftUI

struct InputDetailView: View {
    @EnvironmentObject var items: Items
    @State var expense: String = ""
    @State var titleContent: String = ""
    @State var additionalContent: String = ""
    @Binding var chosenDate: Date
    @Binding var categories: [String]
    @Binding var selectedIndex: Int?
    var body: some View {
        VStack {
            Text("지출 내역 입력")
                .font(.system(size: 20))
            InputDate()
            InputCategory()
            InputExpense(expense: $expense)
            InputTitle(titleContent: $titleContent)
            HStack {
                TextField("추가입력", text: $additionalContent)
                    .padding(.horizontal, 30).padding(.top, 20)
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            Divider()
                .padding(.horizontal, 30)
            HStack {
                Button(action: {
                    let newConsumedItem = ConsumedItem(consumedCategory: categories[selectedIndex ?? 0],
                                                       consumedName: titleContent,
                                                       consumedPrice: Int(expense) ?? 0,
                                                       consumedDate: chosenDate,
                                                       // chosenDate가 challenge 시작 날짜 ~ 오늘 날짜 중이어야 할 것 같습니다!
                                                       consumedMemo: additionalContent,
                                                       challengeCycle: items.challengeCycle)
                    // challengeCycle: items의 getChallengeCycle 함수에 Date Picker로 뽑은 날짜 넣어야 합니다!
                    items.consumedItems.append(newConsumedItem)
                    items.consumedItemSaved()
                    // didSet이기 때문에 중복 저장으로 알고 있습니다!
                }, label: {
                    Text("저장")
                })
                Button(action: {
                    //navi to DetailView
                }, label: {
                    Text("취소")
                })
            }
        }
    }
}

struct InputDate: View {
    @State var chosenDate = Date()
    var body: some View {
        HStack {
            Text("날짜").foregroundColor(Color.systemGray)
            DatePicker("", selection: $chosenDate, displayedComponents: [.date])
                .padding()
                .cornerRadius(15)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 100))
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
    }
}

struct InputCategory: View {
    @State var categories = ["식비", "교통/차량", "패션/미용", "기타"]
    @State var lastSelectedIndex: Int?
    var body: some View {
        HStack {
            Text("분류")
                .foregroundColor(Color.systemGray)
            InputCategoryPicker(data: self.categories, lastSelectedIndex: self.$lastSelectedIndex)
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        Divider()
            .padding(.horizontal, 30).padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
    }
}

struct InputExpense: View {
    @Binding var expense: String
    var body: some View {
        HStack {
            Text("금액")
                .foregroundColor(Color.systemGray)
            TextField("", text: $expense)
                .padding(.horizontal, 30).padding(.top, 20)
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        Divider()
            .padding(.horizontal, 30).padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
    }
}

struct InputTitle: View {
    @Binding var titleContent: String
    var body: some View {
        HStack {
            Text("내용")
                .foregroundColor(Color.systemGray)
            TextField("", text: $titleContent)
                .padding(.horizontal, 30).padding(.top, 20)
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        Divider()
            .padding(.horizontal, 30).padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
    }
}

//struct InputDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        InputDetailView()
//    }
//}
