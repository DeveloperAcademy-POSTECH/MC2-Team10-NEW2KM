//
//  Items.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/16.
//

import Foundation
import SwiftUI

class Items: Identifiable, ObservableObject {
    @Published var targetItems: [TargetItem] = []
    @Published var consumedCategories: [ConsumedCategory] = []
    @Published var consumedItems: [ConsumedItem] = []
    
    var budgetAvailableDay: Int {
        let diff = Calendar.current.dateComponents([.day], from: Date(), to: challengeEndDate).day
        return diff!
    }
    var challengeStartDate: Date {
        let newStartDate = challengeEndDate
        let cycle = 30
        return Calendar.current.date(byAdding: .day, value: -cycle, to: newStartDate)!
    }
    var challengeEndDate: Date {
        let startDate = targetItems[0].startDate
        let cycle = 30
        let offset = cycle * challengeCycle
        return Calendar.current.date(byAdding: .day, value: offset, to: startDate)!
    }
    var untilToday: Int {
        let startDate = targetItems[0].startDate
        let diff = Calendar.current.dateComponents([.day], from: startDate, to: Date()).day
        return diff! + 1
    }
    var challengeCycle: Int {
        let cycle = 30
        return (untilToday - 1) / cycle
        // 주기 로직은 이후에 하기로 합니다!
    }
    var categoryBalances: [(String, Int)] {
        var categoryBalances = [(String, Int)]()
        let categories = consumedCategories.map({ $0.consumedCategory })
        for category in categories {
            let balance = categoryBalance(categoryName: category)
            categoryBalances.append((category, balance))
        }
        return categoryBalances
        // 그리드 -> 해당 카테고리 별 잔액 리턴
    }
    func categoryBalance(categoryName: String) -> Int {
        let consumedItemSpent: Int = consumedItems
            .filter({ $0.consumedCategory == categoryName && $0.challengeCycle == challengeCycle })
            .map({ $0.consumedPrice }).reduce(0, +)
        let categoryLimit = consumedCategories
            .filter({ $0.consumedCategory == categoryName })[0]
            .consumedLimit[challengeCycle]
        return categoryLimit! - consumedItemSpent
        // 이번 챌린지 도전 주기의 해당 카테고리 잔액
    }
    var totalSavedPercent: Double {
        let totalSaved = targetItems[0].totalSaved
        let targetPrice = targetItems[0].targetPrice
        let percent = Double(totalSaved) / Double(targetPrice)
        return percent
    }
    var expectedCategoryBalance: Int {
        return categoryBalances.map({ $0.1 }).reduce(0, +)
    }
    var expectedCategoryBalancePercent: Double {
        let targetPrice = targetItems[0].targetPrice
        let percent = Double(expectedCategoryBalance) / Double(targetPrice)
        return totalSavedPercent + percent
    }
    func load() {
        targetItemLoad()
        consumedItemLoad()
        consumedCategoryLoad()
    }
    func targetItemSaved(encodedData: [TargetItem]) {
        do {
            // 1. 아이템 -> 디코더
            let data = try JSONEncoder().encode(encodedData)
            // 2. url
            let url = getDocumentDirectory().appendingPathComponent("targetItems")
            print(url)
            // 3. 데이터 쓰기
            try data.write(to: url)
            print("Saved well.")
        } catch {
            print("Saving targetItem has failed.")
        }
    }
    func targetItemLoad() {
            do {
                // 1. Get the notes URL file
                let url = getDocumentDirectory().appendingPathComponent("targetItems")
                // 2. Create a new property for the data
                let data = try Data(contentsOf: url)
                // 3. Decode the data
                let targetItems = try JSONDecoder().decode([TargetItem].self, from: data)
                // 4. Initial Setting for items (Enviornment)
                self.targetItems = targetItems
                print("입력 완료")
            } catch {
                // Do nothing
            }
    }
    func consumedItemLoad() {
            do {
                // 1. Get the notes URL file
                let url = getDocumentDirectory().appendingPathComponent("consumedCategories")
                // 2. Create a new property for the data
                let data = try Data(contentsOf: url)
                // 3. Decode the data
                let consumedItems = try JSONDecoder().decode([ConsumedItem].self, from: data)
                // 4. Initial Setting for items (Enviornment)
                self.consumedItems = consumedItems
                print("입력 완료")
            } catch {
                // Do nothing
            }
    }
    func consumedCategoryLoad() {
            do {
                print("DO CHECK")
                // 1. Get the notes URL file
                let url = getDocumentDirectory().appendingPathComponent("consumedItems")
                // 2. Create a new property for the data
                let data = try Data(contentsOf: url)
                // 3. Decode the data
                let consumedCategories = try JSONDecoder().decode([ConsumedCategory].self, from: data)
                // 4. Initial Setting for items (Enviornment)
                self.consumedCategories = consumedCategories
                print("입력 완료")
            } catch {
                // Do nothing
            }
    }
    func consumedCategorySaved(encodedData: [ConsumedCategory]) {
        do {
            // 1. 아이템 -> 디코더
            let data = try JSONEncoder().encode(encodedData)
            // 2. url
            let url = getDocumentDirectory().appendingPathComponent("consumedCategory")
            // 3. 데이터 쓰기
            try data.write(to: url)
        } catch {
            print("Saving targetItem has failed.")
        }
    }
    func consumedItemSaved(encodedData: [ConsumedItem]) {
        do {
            // 1. 아이템 -> 디코더
            let data = try JSONEncoder().encode(encodedData)
            // 2. url
            let url = getDocumentDirectory().appendingPathComponent("consumedItem")
            // 3. 데이터 쓰기
            try data.write(to: url)
        } catch {
            print("Saving targetItem has failed.")
        }
    }
}
