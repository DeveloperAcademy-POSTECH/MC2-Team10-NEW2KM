//
//  CateogryEnum.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/16.
//

import Foundation

enum CategoryEnum: CaseIterable {
    case food
    case cloth
    case daily
    case transportation
    // 식비, 의류, 생활용품, 교통비
    
    func getIcon() -> String {
        switch self {
        case .food:
            return "fork.knife"
        case .cloth:
            return "tshirt"
        case .daily:
            return "bag"
        case .transportation:
            return "bus"
        default:
            return "custom.square.grid.2x2"
        }
    }
    
}
