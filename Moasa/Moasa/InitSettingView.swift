//
//  InitSettingView.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/12.
//

import SwiftUI

extension Color {
    static let accentColor = Color("AccentColor")
    static let kenCustomOrange = Color("KenCustomOrange")
}

struct InitSettingView: View {
    
    @State var targetName: String = ""
    @State var targetPrice: String = ""
    @State var fixedSaving: String = ""
    
    var body: some View {
        TabView {
            VStack {
                HStack {
                    Text("사고 싶은 물건 사진을 넣어주세요.")
                        .font(.system(size: 25, weight: .semibold))
                        .padding(.top, 90)
                    Spacer()
                }.padding(.leading, 16)
                Image(systemName: "photo.fill")
                    .resizable()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 190, height: 190)
                    .padding(.top, 50)
            }

            VStack {
                HStack {
                    Text("사고 싶은 물건을 입력해주세요.")
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
            }

            VStack {
                HStack {
                    Text("물건 가격을 입력해주세요.")
                        .font(.system(size: 25, weight: .semibold))
                        .padding(.top, 90)
                    Spacer()
                }.padding(.leading, 16)
                HStack {
                    TextField("예시: 1,000,000", text: self.$targetPrice)
                        .padding(.leading, 16)
                        .font(.system(size: 17, weight: .regular))
                    Text("원")
                        .font(.system(size: 17, weight: .bold))
                        .padding(.trailing, 16)
                }.padding(.top, 140)
                Divider()
                    .background(Color.accentColor)
                    .padding(.horizontal, 16)
                Spacer()
            }
            VStack {
                HStack {
                    Text("월 고정 저금액을 입력해주세요.")
                        .font(.system(size: 25, weight: .semibold))
                        .padding(.top, 90)
                    Spacer()
                }.padding(.leading, 16)
                HStack {
                    TextField("예시: 100,000", text: self.$fixedSaving)
                        .padding(.leading, 16)
                        .font(.system(size: 17, weight: .regular))
                    Text("원")
                        .font(.system(size: 17, weight: .bold))
                        .padding(.trailing, 16)
                }.padding(.top, 140)
                Divider()
                    .background(Color.accentColor)
                    .padding(.horizontal, 16)
                Spacer()
            }
        }.tabViewStyle(PageTabViewStyle())
            .background(Color.kenCustomOrange)

    }
}

struct InitSettingView_Previews: PreviewProvider {
    static var previews: some View {
        InitSettingView()
    }
}
