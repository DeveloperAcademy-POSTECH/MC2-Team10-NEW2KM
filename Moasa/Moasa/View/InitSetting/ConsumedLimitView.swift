//
//  ConsumedLimitView.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/14.
//

import SwiftUI

struct ConsumedCategories: Hashable {
    var consumedCategory: String
    var consumedAmount: Int
}

struct AmountCategories: View {
    var consumedCategory: String
    var consumedAmount: Int

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .background(.white)
            HStack {
                Text(consumedCategory)
                Spacer()
                Text(String(consumedAmount))
            }
            .font(.system(size: 25, weight: .bold))
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
        }
        .frame(width: 350, height: 100)
        .cornerRadius(13)
    }
}

struct ConsumedLimitOnboarding: View {
    @Environment(\.managedObjectContext) var viewContext

    var consumedCategories = [ConsumedCategories(consumedCategory: "식비", consumedAmount: 100_000),
                              ConsumedCategories(consumedCategory: "교통/차량", consumedAmount: 200_000),
                              ConsumedCategories(consumedCategory: "패션/미용", consumedAmount: 300_000)]
    var consumedCategory: [String] = ["식비", "교통비", "쇼핑"]
    var consumedAmount: [Int] = [100_000, 200_000, 300_000]

    var body: some View {
        VStack {
            HStack {
                Text("예산  항목을 추가해주세요")
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.top, 90)
                    .padding(.bottom, 40)
                Spacer()
            }.padding(.leading, 16)

            Section(header: Text("소비 예산"), content: {
                ForEach(consumedCategories, id: \.self) { category in
                    AmountCategories(consumedCategory: category.consumedCategory,
                                     consumedAmount: category.consumedAmount)
                }
                .frame(width: 350, height: 100)
                        .cornerRadius(13)
            })
        }.background(Color.kenCustomOrange)

        Button(action: {
//                let add = ConsumedCategory(context: self.viewContext)
//                add.consumedCategory = self.consumedCategory
//                add.consumedLimit = self.consumedLimit
//                try? self.viewContext.save()
//                self.dismiss.wrappedValue.dismiss()
        }, label: {
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .background(.white)
                Image(systemName: "plus")
                    .font(.system(size: 25, weight: .bold))
//                    HStack {
//                        VStack {
//                            TextField("소비항목", text: self.$consumedCategory)
//                            Spacer()
//                        }
//                        Spacer()
//                        VStack {
//                            Spacer()
//                            TextField("소비 예산금액", text: self.$consumedLimit)
//                        }
//                    }
//                    .font(.system(size: 25, weight: .bold))
//                    .padding(.vertical, 16)
//                    .padding(.horizontal, 16)
            }.frame(width: 350, height: 100)
                .cornerRadius(13)
        })
        Spacer()
    }
}

struct ConsumedLimitView_Previews: PreviewProvider {
    static var previews: some View {
        ConsumedLimitView()
    }
}
