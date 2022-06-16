//
//  InitSettingView(Toss).swift
//  Moasa
//
//  Created by 지준용 on 2022/06/13.
//

import SwiftUI


struct NewInitSettingView: View {
    @Environment(\.presentationMode) var dismiss
    @EnvironmentObject var items: Items

    @State private var showText = false
    @State private var showTargetImg = false

    @State var show = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var image: Data? = nil
    @State var targetName: String = ""
    @State var targetPrice: Int = 0
    var titleArray: [String] = ["사고 싶은 물건을 입력해주세요", "물건 가격을 입력해주세요", "사고싶은 물건 사진을 넣어주세요"]
    @State var arrayCount: Int = 0
    @State var lastInput = false
    @State var nextView: Bool? = false
    @State var btnText = ["확인", "다음"]

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text(titleArray[arrayCount])
                        .font(.system(size: 25, weight: .semibold))
                        .padding(.top, 90)
                    Spacer()
                }.padding(.leading, 16)

                TargetInput(showText: $showText, showTargetImg: $showTargetImg, show: $show, image: $image, targetName: $targetName, targetPrice: $targetPrice)
// 저장한 뒤에 다음 페이지로 넘어가야 한다.
                TargetButton(showText: $showText, showTargetImg: $showTargetImg, targetName: $targetName,
                             targetPrice: $targetPrice, arrayCount: $arrayCount, lastInput: $lastInput, nextView: $nextView, btnText: $btnText)
            }
            .background(Color.kenCustomOrange)
            .sheet(isPresented: self.$show, content: {
                ImagePicker(images: $image, show: self.$show, sourceType: self.sourceType)
            })
        }
        .background(Color.kenCustomOrange)
        .navigationBarHidden(true)
        .onTapGesture {
            hideKeyboard()
        }
    }
}
