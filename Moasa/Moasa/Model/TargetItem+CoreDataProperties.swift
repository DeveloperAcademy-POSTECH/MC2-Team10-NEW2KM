//
//  TargetItem+CoreDataProperties.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/10.
//
//

import CoreData
import Foundation

extension TargetItem {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TargetItem> {
        return NSFetchRequest<TargetItem>(entityName: "TargetItem")
    }

    @NSManaged public var startDate: Date
    @NSManaged public var id: UUID
    @NSManaged public var targetName: String
    @NSManaged public var targetPrice: Int64
    @NSManaged public var fixedSaving: Int64
    @NSManaged public var targetImage: Data?
    @NSManaged public var challengeCycle: Int64
    public var restPrice: Int64 {
        let categorySaving: Int64 = 10_000
        // 도전 주기 끝난 뒤 ConsumedCategory.saving 알림 -> 입력받고 저금할 금액 입력
        return targetPrice - fixedSaving * challengeCycle - categorySaving
    } // TODO: restPrice에서 categorySaving을 읽어야 하는 문제
    public var restPricePercentage: Int {
        let saved = targetPrice - restPrice
        let percentage = (Double(saved) / Double(targetPrice)) * 100.0
        return Int(percentage)
        // 현 시점 게이지를 몇 퍼 센트 모았는지 알려주는 연산 프로퍼티
    }
}

extension TargetItem: Identifiable {
}
