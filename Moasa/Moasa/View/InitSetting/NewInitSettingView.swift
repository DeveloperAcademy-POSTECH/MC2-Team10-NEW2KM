//
//  NewInitSettingView.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/14.
//

import SwiftUI

struct NewInitSettingView: View {
    var titleArray: [String] = ["사고 싶은 물건을 입력해주세요", "물건 가격을 입력해주세요", "사고싶은 물건 사진을 넣어주세요"]
    @State var arrayCount: Int = 0

    var body: some View {
        VStack {
            HStack {
                
                Text(titleArray[arrayCount])
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.top, 90)
                Spacer()
                
                Button(action: {
                    arrayCount += 1
                }, label: {
                    Text("확인")
                })
            }.padding(.leading, 16)
        }
    }
}

struct NewInitSettingView_Previews: PreviewProvider {
    static var previews: some View {
        NewInitSettingView()
    }
}
