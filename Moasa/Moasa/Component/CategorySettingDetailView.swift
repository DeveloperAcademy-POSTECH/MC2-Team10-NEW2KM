//
//  CategorySettingDetailView.swift
//  Moasa
//
//  Created by 박성수 on 2022/06/11.
//

import SwiftUI

struct Category: Hashable {
    var icon: String
    var category: String
}

struct CategorySettingDetailView: View {
    var categories = [Category(icon: "plus", category: "식비"),
                      Category(icon: "fork.knife", category: "식비"),
                      Category(icon: "car", category: "교통/차량"),
                      Category(icon: "tshirt", category: "패션/미용"),
                      Category(icon: "ellipsis.circle", category: "기타")]
    var body: some View {
        ZStack {
            Color("KellyCustomGray")
                .ignoresSafeArea()
            VStack {
                LazyVGrid(columns: [GridItem(.flexible(minimum: 80)), GridItem(.flexible(minimum: 80))], spacing: 20) {
                    ForEach(categories, id: \.self) { category in
                        if category.icon == "plus" {
                            NavigationLink(destination: CategoryPlusView()) {
                                CategoryPlusRectangle(icon: category.icon)
                            }
                        } else {
                            CategoryItem(icon: category.icon, category: category.category)
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }.padding(EdgeInsets(top: 0, leading: 15, bottom: 20, trailing: 15))
                Spacer()
            }
        }
    }
}

struct CategoryPlusRectangle: View {
    var icon: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
            VStack {
                HStack {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                Text("카테고리 추가하기")
            }
        }
        .frame(height: 80)
    }
}

struct CategoryPlusView: View {
    var body: some View {
        Text("카테고리를 추가하세요!")
    }
}

struct CategoryItem: View {
    var icon: String
    var category: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
            VStack {
                HStack {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text(category)
                        .font(.system(size: 20))
                }
            }
        }
        .frame(height: 80)
    }
}

struct CategorySettingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategorySettingDetailView()
        }
    }
}
