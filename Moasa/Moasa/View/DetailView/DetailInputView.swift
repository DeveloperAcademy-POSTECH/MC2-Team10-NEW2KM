//
//  DetailInputView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/18.
//

import SwiftUI

struct DetailInputView: View {
    // -> 디폴트로 받아올건 받아오기
    @State var consumCategory: String
    @State var consumName: String
    @State var consumPrice: Int
    @State var consumDate = Date()
    @State var consumMemo: String? = nil
    var body: some View {
        VStack {
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $consumName)
            DatePicker(selection: $consumDate,
                       displayedComponents: .date, label: {})
            .labelsHidden()
            //TextField("Placeholder", text: $consumMemo)
        }
    }
}

struct DetailInputView_Previews: PreviewProvider {
    static var previews: some View {
        DetailInputView(consumCategory: "Guitar", consumName: "기타", consumPrice: 999_999_999)
    }
}
