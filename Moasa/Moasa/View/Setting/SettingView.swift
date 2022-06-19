//
//  SettingView.swift
//  Moasa
//
//  Created by 박성수 on 2022/06/11.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var items: Items
    var targetSettingLabelList: [String] = ["목표 이름", "목표 가격", "목표 이미지"]
    var budgetSettingLabelList: [String] = ["고정 저금액", "자유 저금액", "카테고리(항목, 예산)"]
    var targetInitializeLabelList: [String] = ["목표 초기화"]
    var body: some View {
        List {
            Section(header: Text("목표 설정")) {
                ForEach(targetSettingLabelList, id: \.self) { target in
                    NavigationLink(destination: ChangeSettingDetailView(changeTitle: target).environmentObject(items)) {
                        Text(target)
                    }
                }
            }
            Section(header: Text("예산 설정")) {
                ForEach(budgetSettingLabelList, id: \.self) { budget in
                    if budget == "카테고리(항목, 예산)"{
                        NavigationLink(destination: CategorySettingDetailView().environmentObject(items)) {
                            Text(budget)
                        }
                    } else {
                        NavigationLink(destination: ChangeSettingDetailView(changeTitle: budget)
                            .environmentObject(items)) {
                            Text(budget)
                        }
                    }
                }
            }
            Section(header: Text("목표 초기화")) {
                ForEach(targetInitializeLabelList, id: \.self) { target in
                    NavigationLink(destination: InitiateTargetSettingDetailView()) {
                        Text(target)
                    }
                }
            }
        }
//        .onAppear(perform: {
//            UITableView.appearance().contentInset.top = -70
//        })
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingView()
                .environmentObject(Items())
        }
    }
}
