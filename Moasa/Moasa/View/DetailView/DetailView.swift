//
//  DetailView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/13.
//

import SwiftUI

struct DetailView: View {
    var category: ConsumedCategory
    var categorySorted: ConsumedCategory {
        get {
            return dateSort(category: self.category)
        }
        set(category) {
            self.category = dateSort(category: self.category)
        } // DateSort가 ConsumedCategory 내부의 Method인게 가장 깔끔할 것 같습니다.
    }
    var pointerArray: [Int] {
        var dateArray: [Date] = []
        var pointerArray: [Int] = [0]
        for idx in categorySorted.consumedItems {
            dateArray.append(idx.consumedDate) // sort된 상태로 추가하므로 sort 필요 없음
        }
        for idx in 1...dateArray.count {
            if(dateFormatter(date: dateArray[idx], format: "yyMMdd") != dateFormatter(date: dateArray[idx - 1], format: "yyMMdd")) {
                pointerArray.append(idx + 1)
            }
        }
        return pointerArray // Array에 있는 값들이 언제 변화하는지 찍혀져있는 Interger Array가 return 됩니다.
    }
    var index: Int = 0
    var body: some View {
        // Logic >>> sort, filter, etc...
        VStack {
            CircleWaveView(percent: 100)
            SearchBarView()
            VStack {
                LazyVStack {
                    ForEach(0..<categorySorted.consumedItems.count) { idx in
                        DetailBlockDateView(consumedCategory: category, sPointer: pointerArray[idx], ePointer: pointerArray[idx + 1])
                        /*
                        if (i == pointerArray[index]) {
                            Text("씨발")
                            index = index + 1
                        }
                        ForEach(0..<10) { j in
                            DetailListView()
                        }
                         */
                    }
                }
            }
        }
    }
    /*
    func findPointer() -> [Int] {
        var dateArray: [Date]
        var PointerArray: [Int]
        for i in categorySorted.consumedItems {
            dateArray.append(i.consumedDate) // sort된 상태로 추가하므로 sort 필요 없음
        }
        for i in 1...dateArray.count {
            if(dateFormatter(date: dateArray[i], format: "yyMMdd") != dateFormatter(date: dateArray[i - 1], format: "yyMMdd")) {
                PointerArray.append(i + 1)
            }
        }
        return PointerArray
    }
     */
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
