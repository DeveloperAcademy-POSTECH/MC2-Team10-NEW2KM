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
    @EnvironmentObject var items: Items
    var body: some View {
        ZStack {
            Color("KellyCustomGray")
                .ignoresSafeArea()
            VStack {
//                LazyVGrid(columns: [GridItem(.flexible(minimum: 80)), GridItem(.flexible(minimum: 80))], spacing: 20) {
                    NavigationLink(destination: CategoryPlusView().environmentObject(items)) {
                        CategoryPlusRectangle(icon: "plus")
                    }
                List{
                    ForEach(items.categoryBalances, id: \.self) { category in
                        NavigationLink(destination: EditCategory(category: category).environmentObject(items)){
//                            CategoryItem(icon: category.icon, category: category.category)
//                                .aspectRatio(contentMode: .fit)
                            Text(category.category)
                        }
                    }.onDelete(perform: delete)
                }
                }.padding(EdgeInsets(top: 0, leading: 15, bottom: 20, trailing: 15))
                Spacer()
//            }
        }
    }
    func delete(offset: IndexSet){
        withAnimation{
            items.consumedCategories.remove(atOffsets: offset)
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
    @EnvironmentObject var items: Items
    @Environment(\.presentationMode) var presentation
    @State var categoryName: String = ""
    @State var categoryLimitMoney: String = "0"
    var body: some View {
        VStack {
            TextField("카테고리명을 입력하세요", text: $categoryName)
            TextField("카테고리의 제한 금액은?", text: $categoryLimitMoney)
            Button(action: {
                if !categoryName.isEmpty && categoryLimitMoney != "0" {
                    //                    presentation.wrappedValue.dismiss()
                    items.consumedCategories.append( ConsumedCategory(consumedCategory: categoryName, consumedLimit: [0: Int(categoryLimitMoney)!]))
                }
            }, label: {
                Text("저장하기!")
            })
        }
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

struct EditCategory: View {
    @EnvironmentObject var items: Items
    var category: Items.CategoryLeft
    @State var categoryName: String = ""
    @State var categoryLimitMoney: String = "0"
    var body: some View {
        VStack {
            TextField("카테고리명을 입력하세요", text: $categoryName)
            TextField("카테고리의 제한 금액은?", text: $categoryLimitMoney)
            Button(action: {
                if !categoryName.isEmpty && categoryLimitMoney != "0" {
                    items.changeCategoryLimit(categoryName: categoryName, categoryLimit: Int(categoryLimitMoney)!)
                }
            }, label: {
                Text("저장하기!")
            })
        }.onAppear{
            categoryName = category.category
            categoryLimitMoney = String(category.limit[items.challengeCycle]!)
        }
    }
}

struct CategorySettingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategorySettingDetailView()
                .environmentObject(Items())
        }
    }
}
