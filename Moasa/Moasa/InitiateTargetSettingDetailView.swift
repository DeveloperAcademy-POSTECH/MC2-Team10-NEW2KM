//
//  InitiateTargetSettingView.swift
//  Moasa
//
//  Created by 박성수 on 2022/06/11.
//

import SwiftUI

struct InitiateTargetSettingDetailView: View {
    @Environment(\.presentationMode) var presentation
    @State var targetClearAlert: Bool = false
    var body: some View {
        Button(action: {
            targetClearAlert.toggle()
        }, label: {
            Text("클릭시, 목표 물건을 초기화 합니다.")
        })
        .alert(isPresented: $targetClearAlert) { Alert(
            title: Text("목표를 초기화 하시겠습니까?"),
            message: Text("초기화시 되돌릴 수 없습니다."),
            primaryButton: .cancel(Text("닫기")),
            secondaryButton: .destructive(Text("초기화하기"), action : {
                // 여기에 초기화하는 코드 추가하면 될 것 같다
                presentation.wrappedValue.dismiss()
            }))
        }
    }
}

struct InitiateTargetSettingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InitiateTargetSettingDetailView()
    }
}
