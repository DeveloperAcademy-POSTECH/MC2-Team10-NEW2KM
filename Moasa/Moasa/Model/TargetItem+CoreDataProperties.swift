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
}

extension TargetItem: Identifiable {
}
