//
//  ConsumedCategory+CoreDataProperties.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/10.
//
//

import CoreData
import Foundation


extension ConsumedCategory {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ConsumedCategory> {
        return NSFetchRequest<ConsumedCategory>(entityName: "ConsumedCategory")
    }

    @NSManaged public var id: UUID
    @NSManaged public var consumedCategory: String
    @NSManaged public var consumedLimit: Int64
    @NSManaged public var challengeCycle: Int64
    public var validLimit: Double {
        let startDate = Date.distantPast
        // startDate는 targetItem에 기록되어 있음
        let startOfMonth = startDate.startOfMonth()
        let endOfMonth = startDate.endOfMonth()
        // 도전 시작 일 기록
        if isSameMonth(date1: startDate, date2: Date.now) {
            let monthCnt = Calendar.current.dateComponents([.day], from: startOfMonth, to: endOfMonth)
            let currentCnt = Calendar.current.dateComponents([.day], from: startDate, to: endOfMonth)
            let percentage = Double(currentCnt.day!) / Double(monthCnt.day!) * 100
            return Double(consumedLimit) * percentage
        } else {
            return Double(consumedLimit)        }
    }
    // 도전 시작 일이 1일이 아닐 때 실제 유효한 한계 금액을 리턴하는 연산 프로퍼티. Double 캐스팅에 관해 논의 필요
    func isSameMonth(date1: Date, date2: Date) -> Bool {
        let diff = Calendar.current.dateComponents([.year, .month], from: date1, to: date2)
        if diff.year == 0 && diff.month == 0 {
            return true
        } else {
            return false
        }
    }
}

extension ConsumedCategory: Identifiable {
}
