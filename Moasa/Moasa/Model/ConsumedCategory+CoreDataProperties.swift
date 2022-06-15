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
}

extension ConsumedCategory: Identifiable {
}
