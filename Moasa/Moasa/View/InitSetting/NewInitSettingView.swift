//
//  NewInitSettingView.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/14.
//

import SwiftUI

struct NewInitSettingView: View {
    @State private var showText = false

    @State var targetName: String = ""

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
            
            TextField("예시: Airpods Max", text: self.$targetName)
                .padding(.leading, 16)
                .font(.system(size: 17, weight: .regular))
            Divider()
                .background(Color.accentColor)
                .padding(.horizontal, 16)
            Spacer()

                Button(action: {
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
