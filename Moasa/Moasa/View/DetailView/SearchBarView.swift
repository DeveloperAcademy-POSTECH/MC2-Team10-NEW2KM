//
//  SearchBarView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/13.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack {
            Text("서치바")
                .font(.title)
            Spacer()
        }
        .padding(.leading)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
