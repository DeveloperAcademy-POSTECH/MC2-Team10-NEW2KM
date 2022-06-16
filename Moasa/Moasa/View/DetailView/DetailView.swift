//
//  DetailView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/13.
//

import CoreData
import SwiftUI

struct DetailView: View {
    // MARK: 여기의 주석은 CoreData연결 이후에 주석을 제거한다. 디테일 뷰를 확인할 수 없음
    
    var index: Int = 0
    var categoryId: UUID
    var categoryName: String
    var consumedLimit: Int
    @State private var startDate: Date = Date().startOfMonth()
    @State private var endDate: Date = Date()
    @State private var selectedMethod: Bool = false
    // false -> 최신 (자동) true -> 가격
    // Date (연, 월, 일) -> (일 단위 기준)
    // 디폴트: start <-> end까지의 소비 기록을 뽑을 커팅 포인트
    var body: some View {
        Text("Kelly 안녕~")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(categoryId: UUID(), categoryName: "CATEGORY", consumedLimit: 10000)
    }
}
