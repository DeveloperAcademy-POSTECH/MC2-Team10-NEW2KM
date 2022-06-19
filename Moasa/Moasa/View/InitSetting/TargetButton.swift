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
    @Binding var arrayCount: Int
    @Binding var lastInput: Bool
    @Binding var nextView: Bool?
    @Binding var btnText: [String]

    var body: some View {
// 아래부터 역순으로 버튼 생성.
// 3. Button - 입력 정보 저장 및 ConsumedLimitView로 이동
        if lastInput && self.arrayCount == 2 && !targetName.isEmpty {
            NavigationLink(destination: ConsumedLimitView().environmentObject(items), tag: true, selection: $nextView) {
                EmptyView()
            }
            Button(action: {
                withAnimation {
                    let newItem = TargetItem(targetName: targetName, targetImage: image,
                                             targetPrice: targetPrice, totalSaved: 0,
                                             startDate: Date(), fixedSaving: 0)
                    items.targetItems.append(newItem)
                    items.targetItemSaved()
                }
                nextView = true
            }, label: {
                BtnShape(btnText: $btnText[1])
            })
// 2. Button - 금액 입력 시 버튼 생성, 버튼 클릭 시 이미지 피커 생성
        } else if !lastInput && self.targetPrice > 0 && !self.targetName.isEmpty {
            Button(action: {
                showTargetImg = true
                lastInput = true
                arrayCount += 1
            }, label: {
                BtnShape(btnText: $btnText[0])
            }).opacity(self.arrayCount < 2 ? 1: 0)
// 1. Button - 이름입력 시 버튼 생성, 버튼 클릭 시 금액 입력 Textfield 생성.
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
