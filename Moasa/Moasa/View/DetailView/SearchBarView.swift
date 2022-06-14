//
//  SearchBarView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/13.
//

import SwiftUI

struct SearchBarView: View {
    // State Bidning -> startDate, endDate, selectedMethod
    var body: some View {
        HStack {
            Text("서치바")
                .font(.title)
            Spacer()
            Button(action: {
                //: MODAL -> 기간 선택 [DatePicker] + 정렬 방식 [최신/가격]
            }, label: {
                // 예쁘게 해주세요!
            })
        }
        .padding(.leading)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
