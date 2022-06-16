//
//  DetailView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/13.
//

import CoreData
import HalfASheet
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
    @State public var isShowing: Bool = false
    // false -> 최신 (자동) true -> 가격
    // Date (연, 월, 일) -> (일 단위 기준)
    // 디폴트: start <-> end까지의 소비 기록을 뽑을 커팅 포인트
    var body: some View {
        ZStack {
            VStack {
                CircleWaveView(percent: 50)
                SearchBarView(isShowing: isShowing)
            }
            HalfASheet(isPresented: $isShowing) {
                VStack {
                    VStack {
                        Text("소비내역정렬")
                        Spacer()
                        HStack {
                            Picker(selection: $selectedMethod, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                                Text("기간순").tag(1)
                                Text("가격순").tag(2)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                        Spacer()
                    }
                    Divider()
                    VStack {
                        Text("기간")
                        Spacer()
                        HStack {
                            Spacer()
                            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, displayedComponents: .date, label: {})
                                .labelsHidden()
                            Text("~")
                            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, displayedComponents: .date, label: {})
                                .labelsHidden()
                            Spacer()
                        }
                        Spacer()
                        Button("확인") {
                            if Self.isShowing {
                                Self.isShowing.toggle()
                            }
                        }
                    }
                }
            }
            .backgroundColor(.white)
            .height(.proportional(0.5))
            .closeButtonColor(.orange)
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(categoryId: UUID(), categoryName: "CATEGORY", consumedLimit: 10000)
    }
}
