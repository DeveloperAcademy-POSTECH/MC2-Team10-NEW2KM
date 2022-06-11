//
//  SettingView.swift
//  Moasa
//
//  Created by 박성수 on 2022/06/11.
//

import SwiftUI

struct SettingView: View {
    var targetSettingLabelList: [String] = ["목표 이름", "목표 가격", "목표 이미지"]
    var budgetSettingLabelList: [String] = ["고정 저금액", "처음부터 넣을 금액", "카테고리(항목, 예산)"]
    var targetInitializeLabelList: [String] = ["목표 초기화"]
    var body: some View {
        NavigationView {
            VStack {
                List { // 각 설정마다 이동하는 페이지 성격이 다를 것 같아 일단 3파트로 나눠 놨습니다.
                    Section(header: Text("목표 설정")) {
                        ForEach(targetSettingLabelList, id: \.self) { target in
                            NavigationLink(destination: ChangeSettingDetailView(changeTitle: target)) {
                                Text(target)
                            }
                        }
                    }
                    Section(header: Text("예산 설정")) {
                        ForEach(budgetSettingLabelList, id: \.self) { budget in
                            NavigationLink(destination: ChangeSettingDetailView(changeTitle: budget)) {
                                Text(budget)
                            }
                        }
                    }
                    Section(header: Text("목표 초기화")) {
                        ForEach(targetInitializeLabelList, id: \.self) { target in
                            NavigationLink(destination: InitiateTargetSettingView()) {
                                Text(target)
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
