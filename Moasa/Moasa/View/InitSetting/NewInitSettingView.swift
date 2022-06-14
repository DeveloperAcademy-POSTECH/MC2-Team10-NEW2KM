//
//  NewInitSettingView.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/14.
//

import SwiftUI

struct NewInitSettingView: View {
    @State private var showText = false
    @State private var showTargetImg = false

    
    @State var targetName: String = ""
    @State var targetPrice: String = ""

    var titleArray: [String] = ["사고 싶은 물건을 입력해주세요", "물건 가격을 입력해주세요", "사고싶은 물건 사진을 넣어주세요"]
    @State var arrayCount: Int = 0

    var body: some View {
        VStack {
            HStack {
                Text(titleArray[arrayCount])
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.top, 90)
                Spacer()
            }.padding(.leading, 16)
            if showText {
                HStack {
                    TextField("예시: " + numberFormatter(number: 1_000_000), text: self.$targetPrice)
                        .padding(.leading, 16)
                        .font(.system(size: 17, weight: .regular))
                        .keyboardType(.decimalPad)
                    Text("원")
                        .font(.system(size: 17, weight: .bold))
                        .padding(.trailing, 16)
                }
                Divider()
                    .background(Color.accentColor)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
            }
            TextField("예시: Airpods Max", text: self.$targetName)
                .padding(.leading, 16)
                .font(.system(size: 17, weight: .regular))
            Divider()
                .background(Color.accentColor)
                .padding(.horizontal, 16)
            Spacer()

            if !targetPrice.isEmpty && !targetName.isEmpty {
                Button(action: {
                    showTargetImg = true
                    arrayCount += 1
                }, label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 360, height: 60)
                            .cornerRadius(13)
                            .foregroundColor(.accentColor)
                        Text("확인")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
                }).opacity(self.arrayCount < 2 ? 1: 0)
            } else if !targetName.isEmpty {
                Button(action: {
                    showText = true
                    arrayCount += 1
                }, label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 360, height: 60)
                            .cornerRadius(13)
                            .foregroundColor(.accentColor)
                        Text("확인")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
                }).opacity(self.arrayCount < 1 ? 1: 0)
            }
        }
    }
}
