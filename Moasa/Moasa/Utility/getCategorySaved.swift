//
//  getCategorySaved.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/15.
//

import Foundation

func getCategorySaved(consumedItems: [ConsumedItem],
                      consumedCategory: ConsumedCategory,
                      challengeCycle: Int64) -> Int64 {
    // 해당 카테고리 별 limit - 해당 카테고리 별 challengeCycle의 사용 금액
    let challengeLimit = consumedCategory.consumedLimit![challengeCycle]!
    let challengeSpent = consumedItems
        .filter({ $0.consumedCategory == consumedCategory.consumedCategory && $0.challengeCycle == challengeCycle })
        .map({ $0.consumedPrice }).reduce(0, +)
    return challengeLimit - challengeSpent
}
