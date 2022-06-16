//
//  SearchBarView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/13.
//

import HalfASheet
import SwiftUI

struct SearchBarView: View {
    @State var sortMethod = false
    @State var isShowing: Bool = false
    // State Bidning -> startDate, endDate, selectedMethod
    var body: some View {
        HStack {
            Text("서치바")
                .font(.title)
            Spacer()
            Button("터치미") {
                isShowing = toggleMethod(isShowing: isShowing)
            }
        }
    }
    func toggleMethod (isShowing: Bool) -> Bool {
        var returnValue: Bool = isShowing.toggle()
        return isShowing.toggle()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
