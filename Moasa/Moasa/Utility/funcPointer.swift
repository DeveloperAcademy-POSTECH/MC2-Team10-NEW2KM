//
//  funcPointer.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/14.
//

import Foundation

func findPointer(consumedItemsSorted: [ConsumedItem]) -> [Int] {
    var dateArray = consumedItemsSorted.map{$0.consumedDate}
    // a
    var pointerArray: [Int] = [0]
//    for item in consumedItemsSorted {
//        dateArray.append(item.consumedDate)
//        // sort된 상태로 추가하므로 sort 필요 없음
//    }
    for idx in 1..<dateArray.count {
        if(dateFormatter(date: dateArray[idx]!, format: "yyMMdd") != dateFormatter(date: dateArray[idx - 1]!, format: "yyMMdd")) {
            pointerArray.append(idx + 1)
        }
    }
    return pointerArray
    // 같은 날짜 별 가르는 인덱스가 리턴된다.
}
