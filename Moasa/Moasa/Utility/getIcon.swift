//
//  getCategoryName.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/16.
//

import Foundation

func getIcon(categoryName: String) -> String {
    switch categoryName {
    case "식비" :
        return "fork.knife"
    case "패션/미용" :
        return "tshirt"
    case "생활용품" :
        return "bag"
    case "교통/차량" :
        return "bus"
    default:
        return "square.grid.2x2"
    }
    // categoryName -> icon 리턴
}
