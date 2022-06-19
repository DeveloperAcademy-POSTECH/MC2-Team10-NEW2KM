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
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $consumName)
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, value: $consumPrice,
                                            formatter: priceFormatter)
            DatePicker(selection: $consumDate,
                       displayedComponents: .date, label: {})
            .labelsHidden()
            // TextField("Placeholder", text: $consumMemo)
            Picker(selection: $consumCategory,
                   label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                ForEach(items.categoryList, id: \.self) { list in
                    Text(list)
                }
            }
        }
        Button(action: {
            saveItem()
            presentation.wrappedValue.dismiss()
            for idx in items.consumedItems {
                print(idx.consumedName)
            }
        }) {
            Text("확인")
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
        DetailInputView(consumCategory: "Guitar", consumName: "기타", consumPrice: 999_999_999)
    }
}
