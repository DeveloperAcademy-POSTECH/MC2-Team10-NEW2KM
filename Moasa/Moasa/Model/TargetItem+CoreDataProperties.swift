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
    @NSManaged public var totalSaved: Int64
    // TODO: targetItem을 위해 모아놓은 저금 히스토리를 기록해야 할 수 있다 (고정저금액 카운트, 유동저금액 카운트, 추가 절약 금액 날짜별 카운트 등)
    // TODO: (1). MainTitleView: startDate ~ 오늘 날짜까지의 DayCount
    // TODO: (2). TargetContentView: 1. 타겟 이름, 이번 사이클의 남은 총액, targetPrice - totalSaved, 퍼센트 변환 2. Date -> Image로 포맷팅
    // TODO: (3). BudgetContentView: endDate: 연산 프로퍼티를 사용해서 해당 사이클의 마지막 날짜 리턴, today ~ endDate datCount 리턴, 카테고리 데이터
    
    var untilToday: Int {
        let diff = Calendar.current.dateComponents([.day], from: startDate, to: Date())
        return diff.day!
    }
}

extension TargetItem: Identifiable {
}
