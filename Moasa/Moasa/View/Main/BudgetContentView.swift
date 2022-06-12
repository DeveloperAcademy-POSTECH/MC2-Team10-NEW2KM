//
//  BudgetContentView.swift
//  Moasa
//
//  Created by 김원희 on 2022/06/11.
//

import SwiftUI

struct CategoryLeft: Hashable {
    var icon: String
    var category: String
    var left: Int
}

struct BudgetContentView: View {
    var categories = [CategoryLeft(icon: "fork.knife", category: "식비", left: 89_000),
                      CategoryLeft(icon: "car", category: "교통/차량", left: 30_000),
                      CategoryLeft(icon: "tshirt", category: "패션/미용", left: 66_000),
                      CategoryLeft(icon: "ellipsis.circle", category: "기타", left: 5000)]

    var body: some View {
        VStack {
            HStack {
                Text("12일간 사용 가능한 금액")
                    .font(.system(size: 20, weight: .bold))
                Text("(6.12 ~ 7.11)")
                    .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            LazyVGrid(columns: [GridItem(.flexible(minimum: 80)), GridItem(.flexible(minimum: 80))], spacing: 20) {
                ForEach(categories, id: \.self) { category in
                    BudgetItem(icon: category.icon, category: category.category, left: category.left)
                        .aspectRatio(contentMode: .fit)
                }
            }.padding(EdgeInsets(top: 0, leading: 15, bottom: 20, trailing: 15))
        }
    }
}

struct BudgetItem: View {
    var icon: String
    var category: String
    var left: Int
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
            VStack {
                HStack {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: 14, height: 14)
                    Text(category)
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 0))
                HStack {
                    Text("\(left)")
                    Text("원")
                        .font(.system(size: 14))
                }.padding()
            }
        }
        .frame(height: 80)
    }
}

struct BudgetContentView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetContentView()
    }
}
