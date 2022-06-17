//
//  BudgetContentView.swift
//  Moasa
//
//  Created by 김원희 on 2022/06/11.
//

import SwiftUI

struct BudgetContentView: View {
    @EnvironmentObject var items: Items
    let categoryID = UUID()

    var body: some View {
        VStack {
            HStack {
                Text("\(items.budgetAvailableDay)일간 사용 가능한 금액")
                    .font(.system(size: 20, weight: .bold))
                Text("(\(dateFormatter(date: items.challengeStartDate, format: "MM.dd")) ~ \(dateFormatter(date: items.challengeEndDate, format: "MM.dd)"))")
                    .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            LazyVGrid(columns: [GridItem(.flexible(minimum: 80)), GridItem(.flexible(minimum: 80))], spacing: 40) {
                ForEach(items.categoryBalances, id: \.self) { category in
                    NavigationLink(destination:
                                    DetailView(startDate: items.challengeStartDate,
                                               endDate: items.challengeEndDate,
                                               category: category)) {
                        BudgetItem(icon: category.icon, category: category.category, left: category.left)
                            .aspectRatio(contentMode: .fit)
                    }
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
                .opacity(0.5)
                .shadow(radius: 4, y: 10)
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
            .foregroundColor(.black)
        }
        .frame(height: 80)
    }
}

struct BudgetContentView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetContentView()
    }
}
