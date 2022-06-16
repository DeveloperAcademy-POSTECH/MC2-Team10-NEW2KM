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

    @Binding var show: Bool
    
    @Binding var image: Data?
    @Binding var targetName: String
    @Binding var targetPrice: Int

    
    var body: some View {
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
        if showText {
            
            HStack {
                TextField("예시: " + numberFormatter(number: 1_000_000),
                          value: $targetPrice, formatter: NumberFormatter())
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
        
    }
}
