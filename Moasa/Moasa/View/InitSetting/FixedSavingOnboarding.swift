//
//  FixedSavingOnboarding.swift
//  Moasa
//
//  Created by 지준용 on 2022/06/13.
//

import SwiftUI

struct FixedSavingOnboarding: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var dismiss

    @Binding var fixedSaving: String
    var body: some View {
        VStack {
            HStack {
                Text("월 고정 저금액을 입력해주세요")
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.top, 90)
                Spacer()
            }.padding(.leading, 16)
            HStack {
                TextField("예시: " + numberFormatter(number: 100000), text: self.$fixedSaving)
                    .padding(.leading, 16)
                    .font(.system(size: 17, weight: .regular))
                    .keyboardType(.decimalPad)
                Text("원")
                    .font(.system(size: 17, weight: .bold))
                    .padding(.trailing, 16)
            }.padding(.top, 140)
            Divider()
                .background(Color.accentColor)
                .padding(.horizontal, 16)
        }
    }
}
