//
//  TargetButton.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/17.
//

import SwiftUI

struct TargetButton: View {
    @EnvironmentObject var items: Items

    @Binding var showText: Bool
    @Binding var showTargetImg: Bool
    @Binding var image: Data?
    @Binding var targetName: String
    @Binding var targetPrice: Int
    var titleArray: [String] = ["사고 싶은 물건을 입력해주세요", "물건 가격을 입력해주세요", "사고싶은 물건 사진을 넣어주세요"]
    @Binding var arrayCount: Int
    @Binding var lastInput: Bool
    @Binding var nextView: Bool?
    @Binding var btnText: [String]

    var body: some View {
        if lastInput && self.targetPrice > 0 && !targetName.isEmpty {
            NavigationLink(destination: ConsumedLimitView().environmentObject(items), tag: true, selection: $nextView) {
                EmptyView()
            }
            Button(action: {
                withAnimation {
                    let newItem = TargetItem(targetName: targetName, targetImage: image, targetPrice: targetPrice, totalSaved: 0, startDate: Date(), fixedSaving: 0)
                    items.targetItems.append(newItem)
                    items.targetItemSaved()
//                    UserDefaults.standard.set(true, forKey: "initSetting")
                }
                nextView = true
            }, label: {
                BtnShape(btnText: $btnText[1])
            })
        } else if !lastInput && self.targetPrice > 0 && !self.targetName.isEmpty {
            Button(action: {
                showTargetImg = true
                lastInput = true
                arrayCount += 1
            }, label: {
                BtnShape(btnText: $btnText[0])
            }).opacity(self.arrayCount < 2 ? 1: 0)
        } else if !self.targetName.isEmpty {
            Button(action: {
                showText = true
                arrayCount += 1
            }, label: {
                BtnShape(btnText: $btnText[0])
            }).opacity(self.arrayCount < 1 ? 1: 0)
        }
    }
}

struct BtnShape: View {
    @Binding var btnText: String

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 360, height: 60)
                .cornerRadius(13)
                .foregroundColor(.accentColor)
            Text(btnText)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
        }
    }
}
