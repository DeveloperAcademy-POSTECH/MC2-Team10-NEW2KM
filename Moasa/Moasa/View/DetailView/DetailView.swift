//
//  DetailView.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/13.
//

import CoreData
import SwiftUI

struct DetailView: View {
    /*
    // MARK: 여기의 주석은 CoreData연결 이후에 주석을 제거한다. 디테일 뷰를 확인할 수 없음
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
     */
    @Environment(\.managedObjectContext) private var viewContext
    static var getConsumedItem: NSFetchRequest<ConsumedItem> {
        let request: NSFetchRequest<ConsumedItem> = ConsumedItem.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \ConsumedItem.id, ascending: true)]
        // filtering -> ConsumedItem 체크
        return request
    }
    @FetchRequest(fetchRequest: getConsumedItem)
    private var consumedItems: FetchedResults<ConsumedItem>
    var categoryId: UUID
    var categoryName: String
    @State private var startDate: Date = Date().startOfMonth()
    @State private var endDate: Date = Date()
    @State private var selectedMethod: Bool = false
    // false -> 최신 (자동) true -> 가격
    // Date (연, 월, 일) -> (일 단위 기준)
    // 디폴트: start <-> end까지의 소비 기록을 뽑을 커팅 포인트
    
    var body: some View {
        var consumedItemsFiltered = consumedItems.filter{$0.consumedCategory == categoryName && $0.consumedDate >= startDate && $0.consumedDate <= endDate}
        var consumedItemsSorted = consumedItemsFiltered.sorted(by: selectedMethod ? {$0.consumedPrice > $1.consumedPrice} : {$0.consumedDate < $1.consumedDate})
        // 기간, 정렬 조건 -> consumedItems 필터링 및 정렬 완료
        // DetailBlockDateView에서 리스트 (+섹션) 그리기
        VStack {
            CircleWaveView(percent: 100)
            SearchBarView()
            VStack {
                LazyVStack {
                    // MARK: 여기의 주석은 CoreData연결 이후에 주석을 제거한다. 디테일 뷰를 확인할 수 없음
                    ForEach(0..<consumedItemsSorted.count) { idx in
                        DetailBlockDateView(consumedCategory: category, sPointer: pointerArray[idx], ePointer: pointerArray[idx + 1])
                        /*
                        if (i == pointerArray[index]) {
                            Text("")
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

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(categoryId: UUID(), categoryName: "CATEGORY")
    }
}
