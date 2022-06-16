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
    
    struct CategoryLeft: Hashable {
        var icon: String
        var category: String
        var left: Int
        var limit: [Int:Int]
    }
    
    var categoryBalances: [CategoryLeft] {
        // CategryName, CategoryIcon, CategoryBalance 리턴
        var categoryBalances = [CategoryLeft]()
        let categories = consumedCategories.map({ ($0.consumedCategory, $0.consumedLimit )})
        for category in categories {
            let balance = categoryBalance(categoryName: category.0)
            let categoryIcon = getIcon(categoryName: category.0)
            let limit = category.1
            categoryBalances.append(CategoryLeft(icon: categoryIcon, category: category.0, left: balance, limit: limit))
//            categoryBalances.append((category, categoryIcon, balance))
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
        return categoryBalances.map({ $0.left }).reduce(0, +)
    }
    var expectedCategoryBalancePercent: Double {
        let targetPrice = targetItems[0].targetPrice
        let percent = Double(expectedCategoryBalance) / Double(targetPrice)
        return totalSavedPercent + percent
    }
    // MAIN Computed Property
    // Date -> 해당 Date가 전체 챌린지 사이클 중 어떤 챌린지 사이클의 소비 항목인지 계산해주는 함수
    func getChallengeCycle(consumedDate: Date) -> Int {
        let startDate = targetItems[0].startDate
        let diff = Calendar.current.dateComponents([.day], from: startDate, to: consumedDate).day!
        let cycle = 30
        return diff / cycle
        // TODO: 데이트 피커 -> 타겟 시작 날짜보다 이전으로 가지 않게 한다.
    }
    
    // 먼저 기간 분류(startDate, endDate) -> 정렬 분류 필터링을 $0.consumed
    
    func getCategoryItemsFiltered(categoryName: String, startDate: Date, endDate: Date) -> [ConsumedItem] {
        let itemFiltered = consumedItems.filter({ $0.consumedCategory == categoryName && $0.consumedDate >= startDate && $0.consumedDate <= endDate})
        return itemFiltered
        // 카테고리 별 기간 내 소비 아이템 리턴
    }
    
    // DetailView Computed Property
    func load() {
        consumedCategoryLoad()
        targetItemLoad()
//        consumedItemLoad()
    }
    func targetItemSaved() {
        do {
            // 1. 아이템 -> 디코더
            let data = try JSONEncoder().encode(targetItems)
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
                print("URL")
                print(url)
                // 2. Create a new property for the data
                let data = try Data(contentsOf: url)
                print("DATA")
                // 3. Decode the data
                let targetItems = try JSONDecoder().decode([TargetItem].self, from: data)
                print("DECODE")
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
                let url = getDocumentDirectory().appendingPathComponent("consumedItems")
                // 2. Create a new property for the data
                let data = try Data(contentsOf: url)
                // 3. Decode the data
                let consumedItems = try JSONDecoder().decode([ConsumedItem].self, from: data)
                // 4. Initial Setting for items (Enviornment)
                self.consumedItems = consumedItems
//
                print("입력 완료")
            } catch {
                // Do nothing
            }
    }
    func consumedCategoryLoad() {
            do {
                print("DO CHECK")
                // 1. Get the notes URL file
                let url = getDocumentDirectory().appendingPathComponent("consumedCategories")
                print("CATEGORY URL")
                // 2. Create a new property for the data
                let data = try Data(contentsOf: url)
                print("CATEGORY DATA")

                // 3. Decode the data
                let consumedCategories = try JSONDecoder().decode([ConsumedCategory].self, from: data)
                print("CATEGORY DECODE")

                // 4. Initial Setting for items (Enviornment)
                self.consumedCategories = consumedCategories
                print("CATEGORY CHECK")

                print("카테고리 입력 완료")
            } catch {
                // Do nothing
            }
    }
    func consumedCategorySaved() {
        do {
            // 1. 아이템 -> 디코더
            let data = try JSONEncoder().encode(consumedCategories)
            // 2. url
            let url = getDocumentDirectory().appendingPathComponent("consumedCategories")
            // 3. 데이터 쓰기
            try data.write(to: url)
        } catch {
            print("Saving targetItem has failed.")
        }
    }
    func consumedItemSaved() {
        do {
            // 1. 아이템 -> 디코더
            let data = try JSONEncoder().encode(consumedItems)
            // 2. url
            let url = getDocumentDirectory().appendingPathComponent("consumedItems")
            // 3. 데이터 쓰기
            try data.write(to: url)
        } catch {
            print("Saving targetItem has failed.")
        }
    }
}
