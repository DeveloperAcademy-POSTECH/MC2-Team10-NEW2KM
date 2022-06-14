//
//  ConsumedItem+CoreDataProperties.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/10.
//
//

import Foundation
import CoreData


extension ConsumedItem {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ConsumedItem> {
    return NSFetchRequest<ConsumedItem>(entityName: "ConsumedItem")
    }

    @NSManaged public var id: UUID
    @NSManaged public var challengeCycle: Int64
    @NSManaged public var consumedCategory: String
    @NSManaged public var consumedName: String
    @NSManaged public var consumedDate: Date
    @NSManaged public var consumedMemo: String
    @NSManaged public var consumedPrice: Int64
}

extension ConsumedItem: Identifiable {
}
