//
//  SearchBarView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/13.
//

import SwiftUI

struct SearchBarView: View {
    @State var sortMethod = false
    @Binding var isShowing: Bool
    // State Bidning -> startDate, endDate, selectedMethod
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            Spacer()
            Button("정렬·기간 설정") {
                isShowing.toggle()
            }
            Image(systemName: "arrowtriangle.down.fill")
                .frame(width: 5, height: 5)
                .foregroundColor(Color.accentColor)
        }
        Divider()
        .padding(.horizontal)
    }
}
/*
struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(isShowing: <#T##Binding<Bool>#>)
    }
}
 */
