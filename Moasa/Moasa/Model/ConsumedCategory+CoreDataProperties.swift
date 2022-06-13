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
    @NSManaged public var consumedItems: [ConsumedItem]
    public var saving: Int64 {
        let monthSpent = consumedItems
            .filter({ isSameMonth(date1: $0.consumedDate, date2: Date.now ) })
            .map({ $0.consumedPrice })
            .reduce(0, +)
        let saving = consumedLimit - monthSpent
        return max(saving, 0)
        // 특정 카테고리 별 현재 달 소비 가격: 음수의 경우 saving X -> 0 리턴
    }
    func isSameMonth(date1: Date, date2: Date) -> Bool {
        let diff = Calendar.current.dateComponents([.month], from: date1, to: date2)
        if diff.month == 0 {
            return true
        } else {
            return false
        }
    }
}

extension ConsumedCategory: Identifiable {
}
