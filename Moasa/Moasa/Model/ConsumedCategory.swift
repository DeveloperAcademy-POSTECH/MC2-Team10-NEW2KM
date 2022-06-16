//
//  ConsumedCategory.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/16.
//

import Foundation

struct ConsumedCategory: Identifiable, Codable {
    let id = UUID()
    var consumedCategory: String
    var fixedSaving: [Int:Int]
}
