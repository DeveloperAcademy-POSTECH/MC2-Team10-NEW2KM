//
//  InitSettingView.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/12.
//

import SwiftUI

struct InitSettingView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var dismiss
    @State public var image: Data = .init(count: 1)
    @State public var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State public var show: Bool = false
    @State var targetName: String = ""
    @State var targetPrice: String = ""
    @State var fixedSaving: String = ""
    var body: some View {
        TabView {
            // FirstOnBoarding
            ImageInputOnboarding(image: $image, sourceType: $sourceType, show: $show)
                .sheet(isPresented: self.$show, content: {
                    ImagePicker(images: self.$image, show: self.$show, sourceType: self.sourceType)
                })
            // SecondOnBoarding
            TargetNameOnboarding(targetName: $targetName)
            // ThirdOnBoarding
            TargetPriceOnboarding(targetPrice: $targetPrice)
            // FourthOnBoarding
            VStack {
                FixedSavingOnboarding(fixedSaving: $fixedSaving)
                Spacer()
                NavigationLink(destination: MainView()) {
                        ZStack {
                            Rectangle()
                                .frame(width: 360, height: 60)
                                .cornerRadius(13)
                                .foregroundColor(self.fixedSaving > "" ? .accentColor : .gray)
                                .opacity(self.fixedSaving > "" ? 1 : 0.2)
                            Text(self.fixedSaving > "" ? "입력 완료": "다음에 할게요")
                                .foregroundColor(self.fixedSaving > "" ? .white : .gray)
                                .font(.system(size: 20, weight: .bold))
                        }
//                        .onTapGesture {
                            // 클릭하고나면, coredata 내부로 저장을 해주게 되는 로직
                            //                            let add = TargetItem(context: self.viewContext)
                            //                            add.targetImage = self.image
                            //
                            //                            try? self.viewContext.save()
                            //
                            //                            self.dismiss.wrappedValue.dismiss()
                            //                            self.image.count = 0
//                        }
                }
                .padding(.bottom, 40)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.kenCustomOrange)
        .navigationBarHidden(true)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct InitSettingView_Previews: PreviewProvider {
    static var previews: some View {
        InitSettingView()
    }
}
