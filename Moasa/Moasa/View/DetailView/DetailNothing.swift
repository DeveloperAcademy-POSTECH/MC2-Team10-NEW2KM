//
//  DetailNothing.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/17.
//

import SwiftUI

struct DetailNothing: View {
    var body: some View {
        Text("이 기간동안 기록된 소비 내역이 존재하지 않아요.")
    }
}

struct DetailNothing_Previews: PreviewProvider {
    static var previews: some View {
        DetailNothing()
    }
}
