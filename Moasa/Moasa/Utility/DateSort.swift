//
//  DateSort.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/13.
//

import Foundation

func dateSort(category: ConsumedCategory) -> ConsumedCategory {
    /*
    var dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MM, yyyy"// yyyy-MM-dd"
    */
    category.consumedItems = category.consumedItems.sorted(by: {$0.consumedDate > $1.consumedDate} )
    //var ready = convertedArray.sorted(by: { $0.compare($1) == .orderedDescending })
    return category
}
