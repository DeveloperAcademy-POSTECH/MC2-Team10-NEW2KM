//
//  TargetPriceOnboarding.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/13.
//

import SwiftUI

struct TargetPriceOnboarding: View {
    @Binding var targetPrice: String

    var body: some View {
        VStack {
            HStack {
                Text("물건 가격을 입력해주세요")
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.top, 90)
                Spacer()
            }.padding(.leading, 16)
            HStack {
                TextField("예시: " + numberFormatter(number: 1_000_000), text: self.$targetPrice)
                    .padding(.leading, 16)
                    .font(.system(size: 17, weight: .regular))
                    .keyboardType(.decimalPad)
                Text("원")
                    .font(.system(size: 17, weight: .bold))
                    .padding(.trailing, 16)
            }.padding(.top, 140)
            Divider()
                .background(Color.accentColor)
                .padding(.horizontal, 16)
            Spacer()
            NavigationLink(destination: MainView()) {
                ZStack {
                    Rectangle()
                        .frame(width: 360, height: 60)
                        .cornerRadius(13)
                        .foregroundColor(self.targetPrice > "" ? .accentColor: .gray)
                        .opacity(self.targetPrice > "" ? 1 : 0.2)
                    Text(self.targetPrice > "" ? "다음" : "다음에 할게요")
                        .foregroundColor(self.targetPrice > "" ? .white : .gray)
                        .font(.system(size: 20, weight: .bold))
                }
            }.padding(.bottom, 40)
        }
    }
}
