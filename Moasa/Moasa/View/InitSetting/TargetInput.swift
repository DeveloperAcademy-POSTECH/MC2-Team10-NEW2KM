//
//  TargetInput.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/17.
//

import SwiftUI

struct TargetInput: View {
    @Binding var showText: Bool
    @Binding var showTargetImg: Bool

    @Binding var targetPrice: Int
    @State var text: String = ""
    @Binding var targetName: String

    @Binding var show: Bool
    @Binding var image: Data?

    var body: some View {
// 아래부터 역순으로 Component생성
// 3.이미지 피커
        if showTargetImg {
            if image == nil {
                Button(action: {
                    self.show.toggle()
                }, label: {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 190, height: 190)
                        .padding(.top, 50)
                })
            } else {
                Button(action: {
                    self.show.toggle()
                }, label: {
                    Image(uiImage: UIImage(data: self.image!)!)
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 190, height: 190)
                        .padding(.top, 50)
                })
            }
        }
// 2.금액입력 TextField
        if showText {
            HStack {
                TextField("금액을 입력해주세요.", text: $text)
                    .onChange(of: text) {newValue in
                        targetPrice = Int(newValue)!
                    }
                    .padding(.leading, 16)
                    .font(.system(size: 17, weight: .regular))
                    .keyboardType(.numberPad)

                Text("원")
                    .font(.system(size: 17, weight: .regular))
                    .padding(.trailing, 16)
            }
            Divider()
                .background(Color.accentColor)
                .padding(.horizontal, 16)
                .padding(.trailing, 20)
                .padding(.bottom, 20)
        }
// 1. 목표물건 명칭 입력 TextField
        TextField("예시: Airpods Max", text: self.$targetName)
            .padding(.leading, 16)
            .font(.system(size: 17, weight: .regular))
            .disableAutocorrection(true)
        Divider()
            .background(Color.accentColor)
            .padding(.horizontal, 16)
        Spacer()
    }
}
