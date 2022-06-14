//
//  SearchBarView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/13.
//

import SwiftUI

struct SearchBarView: View {
    let sampleData = ["Garak", "투움바 파스타", "양고기"]
    var searchResults: [String] {
        if searchText.isEmpty {
            return sampleData
        } else {
            return sampleData.filter { $0.contains(searchText) }
        }
    }
    @State private var searchText = ""
    var body: some View {
        HStack {
            Text("서치바")
                .font(.title)
            VStack {
                NavigationView {
                    List {
                        ForEach(searchResults, id: \.self) { name in
                            NavigationLink(destination: Text(name)) {
                                Text(name)
                            }
                        }
                    }
                    .searchable(text: $searchText)
                }
                Spacer()
            }
            .padding(.leading)
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
