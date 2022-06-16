//
//  getCategoryName.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/16.
//

import Foundation

func getIcon(categoryName: String) -> String {
    switch categoryName {
    case "food" :
        return "fork.knife"
    case "cloth" :
        return "tshirt"
    case "daily" :
        return "bag"
    case "transportation" :
        return "bus"
    default:
        return "square.grid.2x2"
    }
    // categoryName -> icon 리턴
}
