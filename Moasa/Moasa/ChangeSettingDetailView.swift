//
//  TargetNameChangeView.swift
//  Moasa
//
//  Created by 박성수 on 2022/06/11.
//

import SwiftUI

struct ChangeSettingDetailView: View {
    @Environment(\.presentationMode) var presentation
    @State var changeTargetName: String = ""
    var changeTitle: String
    var body: some View {
        VStack(spacing: 50) {
            HStack(alignment: .firstTextBaseline) {
                Text("변경할")
                Text("\(changeTitle)")
                    .bold()
                    .font(.system(size: 30))
                Text("을 입력해 주세요.")
                Spacer()
            }.font(.system(size: 20))
            .padding()
            HStack {
                TextField(changeTitle, text: $changeTargetName)
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }, label: {
                    Text("저장하기")
                })
            }
            .padding()
            Spacer()
        }
    }
}

struct ChangeSettingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChangeSettingDetailView(changeTitle: "목표 이름")
        }
    }
}
