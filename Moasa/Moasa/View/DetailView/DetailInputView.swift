//
//  DetailInputView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/18.
//

import SwiftUI

struct DetailInputView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var items: Items
    @State var consumCategory: String
    @State var consumName: String
    @State var consumPrice: Int
    @State var consumDate = Date()
    @State var consumMemo: String? = nil
    let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("내용")
                    .foregroundColor(Color.systemGray)
                TextField("내역을 입력하세요", text: $consumName)
                    .padding(.horizontal, 30).padding(.top, 20)
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            Divider()
                .padding(.horizontal, 30).padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
            HStack {
                Text("금액")
                    .foregroundColor(Color.systemGray)
                TextField("0", value: $consumPrice,
                                                formatter: priceFormatter)
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            Divider()
                .padding(.horizontal, 30).padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
            HStack {
                Text("날짜").foregroundColor(Color.systemGray)
                DatePicker(selection: $consumDate,
                           displayedComponents: .date, label: {})
                .labelsHidden()
                    .padding()
                    .cornerRadius(15)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 100))
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            // TextField("Placeholder", text: $consumMemo)
            HStack {
                Text("분류")
                    .foregroundColor(Color.systemGray)
                Picker("이름", selection: $consumCategory, content: {
                    ForEach(items.categoryList, id: \.self, content: { list in
                        Text(list)
                    })
                })
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            Divider()
                .padding(.horizontal, 30).padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
            Button(action: {
                saveItem()
                presentation.wrappedValue.dismiss()
                for idx in items.consumedItems {
                    print(idx.consumedName)
                }
            }) {
                Text("확인")
            }
            .padding(EdgeInsets(top: 20, leading: 160, bottom: 0, trailing: 0))
        }
    }
    func saveItem() {
        items.consumedItems.append(ConsumedItem(consumedCategory: consumCategory,
                                                consumedName: consumName,
                                                consumedPrice: consumPrice,
                                                consumedDate: consumDate,
                                                challengeCycle: items.getChallengeCycle(consumedDate: consumDate)))
    }
}

struct DetailInputView_Previews: PreviewProvider {
    static var previews: some View {
        DetailInputView(consumCategory: "Guitar", consumName: "기타", consumPrice: 0)
    }
}
