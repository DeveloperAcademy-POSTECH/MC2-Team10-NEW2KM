//
//  TargetNameOnboarding.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/13.
//

import SwiftUI

struct TargetNameOnboarding: View {
    @Binding var targetName: String

    var body: some View {
        VStack {
            HStack {
                Text("사고 싶은 물건을 입력해주세요")
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.top, 90)
                Spacer()
            }.padding(.leading, 16)

            TextField("예시: Airpods Max", text: self.$targetName)
                .padding(.leading, 16)
                .font(.system(size: 17, weight: .regular))
                .padding(.top, 140)
            Divider()
                .background(Color.accentColor)
                .padding(.horizontal, 16)
            Spacer()
            NavigationLink(destination: MainView()) {
                ZStack {
                    Rectangle()
                        .frame(width: 360, height: 60)
                        .cornerRadius(13)
                        .foregroundColor(self.targetName > "" ? .accentColor: .gray)
                        .opacity(self.targetName > "" ? 1 : 0.2)
                    Text(self.targetName > "" ? "다음" : "다음에 할게요")
                        .foregroundColor(self.targetName > "" ? .white: .gray)
                        .font(.system(size: 20, weight: .bold))
                }
            }.padding(.bottom, 40)
        }
    }
}
