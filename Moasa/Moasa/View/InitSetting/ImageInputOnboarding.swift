//
//  ImageInputOnboarding.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/13.
//

import SwiftUI

struct ImageInputOnboarding: View {
    @Binding public var image: Data
    @Binding public var sourceType: UIImagePickerController.SourceType
    @Binding public var show: Bool

    var body: some View {
        VStack {
            HStack {
                Text("사고 싶은 물건 사진을 넣어주세요")
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.top, 90)
                Spacer()
            }.padding(.leading, 16)

            if self.image.count != 1 {
                Button(action: {
                    self.show.toggle()
                }, label: {
//                    Image(uiImage: UIImage(data: TargetItem().targetImage ?? self.image)!)
                    Image(uiImage: UIImage(data: self.image)!)
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
                    Image(systemName: "photo.fill")
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 190, height: 190)
                        .padding(.top, 50)
                })
            }
            Spacer()
            if self.image.count != 1 {
                NavigationLink(destination: MainView()) {
                    ZStack {
                        Rectangle()
                            .frame(width: 360, height: 60)
                            .cornerRadius(13)
                            .foregroundColor(.accentColor)
                        Text("다음")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
                }.padding(.bottom, 40)
            } else {
                NavigationLink(destination: MainView()) {
                    ZStack {
                        Rectangle()
                            .frame(width: 360, height: 60)
                            .cornerRadius(13)
                            .foregroundColor(.gray)
                            .opacity(0.2)
                        Text("다음에 할게요")
                            .foregroundColor(.gray)
                            .font(.system(size: 20, weight: .bold))
                    }
                }.padding(.bottom, 40)
            }
        }
    }
}
