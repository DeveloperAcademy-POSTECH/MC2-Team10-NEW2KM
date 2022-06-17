//
//  TargetNameChangeView.swift
//  Moasa
//
//  Created by 박성수 on 2022/06/11.
//

import SwiftUI

struct ChangeSettingDetailView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var items: Items
    @State var changeTargetName: String = ""
    var changeTitle: String
    var body: some View {
        VStack(spacing: 50) {
            VStack {
                HStack(alignment: .firstTextBaseline) {
                    Text("변경할")
                    Text("\(changeTitle)")
                        .bold()
                        .font(.system(size: 30))
                    Text("을 입력해 주세요.")
                    Spacer()
                }.font(.system(size: 20))
                    .padding()
                HStack {
                        Text(changeTitle == "목표 이름" ? "변경 전 \(changeTitle) : \(items.targetItems[0].targetName)" :
                                "변경 전 '\(changeTitle)' : \(items.targetItems[0].targetPrice)")
                    Spacer()
                }
                .padding()
            }
            HStack {
                TextField(changeTitle, text: $changeTargetName)
                Button(action: {
                    var changeValue: TargetItem?
                    if changeTitle == "목표 이름" {
                        changeValue = saveTargetName(changeTitle: changeTargetName)
                    } else if changeTitle == "목표 가격" {
                        changeValue = saveTargetPrice(changeTitle: changeTargetName)
                    } else if changeTitle == "고정 저금액" {
                        changeValue = saveTargetFixed(changeTitle: changeTargetName)
                    }
                    items.targetItems[0] = changeValue!
                    presentation.wrappedValue.dismiss()
                }, label: {
                    Text("저장하기")
                })
            }
            .padding()
            Spacer()
        }
    }
    func saveTargetName(changeTitle: String) -> TargetItem {
        return TargetItem(targetName: changeTitle,
                          targetPrice: items.targetItems.first!.targetPrice,
                          fixedSaving: items.targetItems.first!.fixedSaving)
    }
    func saveTargetPrice(changeTitle: String) -> TargetItem {
        return TargetItem(targetName: items.targetItems.first!.targetName,
                          targetPrice: Int(changeTitle)!,
                          fixedSaving: items.targetItems.first!.fixedSaving)
    }
    func saveTargetFixed(changeTitle: String) -> TargetItem {
        return TargetItem(targetName: items.targetItems.first!.targetName,
                          targetPrice: items.targetItems.first!.targetPrice,
                          fixedSaving: Int(changeTitle)!)
    }
}

struct ChangeSettingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChangeSettingDetailView(changeTitle: "목표 이름")
                .environmentObject(Items())
        }
    }
}
