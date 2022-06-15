//
//  InputDetailView.swift
//  Moasa
//
//  Created by 김원희 on 2022/06/13.
//

import SwiftUI

struct InputDetailView: View {
    @State var expense: String = ""
    @State var titleContent: String = ""
    @State var additionalContent: String = ""
    var body: some View {
        VStack {
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
                    
                }, label: {
                    Text("저장")
                })
                Button(action: {
                    
                }, label: {
                    Text("취소")
                })
            }
        }
    }
}

struct InputDate: View {
    @State var date = Date()
    var body: some View {
        HStack {
            Text("날짜").foregroundColor(Color.systemGray)
            DatePicker("", selection: $date, displayedComponents: [.date])
                .padding()
                .cornerRadius(15)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 100))
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
//        Divider()
//            .padding(.horizontal, 30).padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
    }
    //    @Binding var date: String
    //    var body: some View {
    //        HStack {
    //            Text("날짜")
    //                .foregroundColor(Color.systemGray)
    //            TextField("", text: $date)
    //                .padding(.horizontal, 30).padding(.top, 20)
    //        }
    //        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
    //        Divider()
    //            .padding(.horizontal, 30).padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
    //    }
}

struct InputCategory: View {
    var categories = ["식비", "교통/차량", "패션/미용", "기타"]
    @State var lastSelectedIndex: Int?
    var body: some View {
        HStack {
            Text("분류")
                .foregroundColor(Color.systemGray)
            InputCategoryPicker(data: self.categories, lastSelectedIndex: self.$lastSelectedIndex)
            //            InputCategoryPicker(data: self.categories,
            //                                selectionIndex: self.$selectionIndex, text: self.$category)
            //            Picker("", selection: $selectedCategory) {
            //                ForEach(categories, id: \.self) {
            //                    Text($0)
            //                }
            //            }
            //            TextField("", text: $category)
            //                .padding(.horizontal, 30).padding(.top, 20)
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

struct InputDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InputDetailView()
    }
}
