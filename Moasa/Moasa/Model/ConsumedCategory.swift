//
//  ConsumedCategory.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/16.
//

import Foundation

struct ConsumedCategory: Identifiable, Codable {
    var id = UUID()
    var consumedCategory: String
    var consumedLimit: [Int:Int]
}

