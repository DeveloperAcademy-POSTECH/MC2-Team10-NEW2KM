//
//  TargetItem.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/16.
//

import Foundation

struct TargetItem: Codable, Identifiable{
    let id = UUID()
    var targetName: String
    var targetImage: Data? = nil
    var targetPrice: Int
    var totalSaved = 0
    var startDate: Date = Date()
    var fixedSaving: Int
}

