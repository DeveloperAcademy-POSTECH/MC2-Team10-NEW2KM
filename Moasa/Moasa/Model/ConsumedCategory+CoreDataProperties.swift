//
//  ConsumedCategory+CoreDataProperties.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/15.
//
//

import Foundation
import CoreData


extension ConsumedCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ConsumedCategory> {
        return NSFetchRequest<ConsumedCategory>(entityName: "ConsumedCategory")
    }

    @NSManaged public var challengeCycle: Int64
    @NSManaged public var consumedCategory: String?
    @NSManaged public var consumedLimit: [Int64:Int64]?
    @NSManaged public var id: UUID?

}

extension ConsumedCategory : Identifiable {

}
