//
//  Items.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/16.
//

import Foundation
import SwiftUI

class Items: Identifiable, ObservableObject {
    @Published var targetItems: [TargetItem] = [] {
        didSet {
            targetItemSaved()
        }
    }
    @Published var consumedCategories: [ConsumedCategory] = [] {
        didSet {
            consumedCategorySaved()
        }
    }
    @Published var consumedItems: [ConsumedItem] = [] {
        didSet {
            consumedItemSaved()
        }
    }
    var budgetAvailableDay: Int {
        let diff = Calendar.current.dateComponents([.day], from: Date(), to: challengeEndDate).day
        return 30 - diff!
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
        var limit: [Int: Int]
    }
    var categoryBalances: [CategoryLeft] {
        // CategryName, CategoryIcon, CategoryBalance 리턴
        var categoryBalances = [CategoryLeft]()
        let categories = consumedCategories.map({ ( $0.consumedCategory, $0.consumedLimit ) })
        for category in categories {
            let balance = categoryBalance(categoryName: category.0)
            let categoryIcon = getIcon(categoryName: category.0)
            let limit = category.1
            categoryBalances.append(CategoryLeft(icon: categoryIcon, category: category.0, left: balance, limit: limit))
        }
        return categoryBalances
        // 그리드 -> 해당 카테고리 별 잔액 리턴
    }
    var categoryList: [String] {
        var tempList: [String] = []
        for category in consumedCategories {
            tempList.append(category.consumedCategory)
        }
        let tempSet: Set = Set(tempList)
        return Array(tempSet)
    }
    func categoryBalance(categoryName: String) -> Int {
        let consumedItemSpent: Int = consumedItems
            .filter({ $0.consumedCategory == categoryName && $0.challengeCycle == challengeCycle })
            .map({ $0.consumedPrice }).reduce(0, +)
        let categoryLimit = consumedCategories
            .filter({ $0.consumedCategory == categoryName })[0]
            .consumedLimit[challengeCycle]
        return categoryLimit! - consumedItemSpent
        // TODO: 0원이 되어 있을 때 디폴트 값 설정하기 (guard let)
        // 이번 챌린지 도전 주기의 해당 카테고리 잔액
    }
    func balancePercent(categoryName: String) -> Double {
        let categoryBalance = categoryBalance(categoryName: categoryName)
        let categoryLimit = consumedCategories
            .filter({ $0.consumedCategory == categoryName })[0]
            .consumedLimit[challengeCycle]
        let percent = (Double(categoryBalance) / Double(categoryLimit!))
        return percent
        // 각 카테고리 별 이번 챌린지 주기 남은 금액의 퍼센트를 리턴
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
//         1: 모든 아이템 확인
        print(consumedItems.last!.consumedName)
//         2. 카테고리 이름 확인
//        print(consumedItems.filter{$0.consumedCategory == categoryName}[0])
        print(consumedItems.filter{$0.consumedCategory == categoryName})
//         3. 카테고리 날짜 확인
        print("\(consumedItems.last!.consumedDate)")
//         4. 들어온 날짜 확인
        print("\(startDate)")
        print("\(endDate)")
        let itemFiltered = consumedItems
            .filter({
                $0.consumedCategory == categoryName &&
                Calendar.current.dateComponents([.day], from: startDate, to: $0.consumedDate).day! >= 0 &&
                Calendar.current.dateComponents([.day], from: $0.consumedDate, to: Date()).day! <= 0
            })
        return itemFiltered
        // 카테고리 별 기간 내 소비 아이템 리턴
    }
    // DetailView Computed Property
    func load() {
        consumedCategoryLoad()
        targetItemLoad()
        consumedItemLoad()
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
    func changeCategoryLimit(categoryName: String, categoryLimit: Int) {
        for idx in 0..<consumedCategories.count {
            if consumedCategories[idx].consumedCategory == categoryName {
                consumedCategories[idx].consumedLimit[challengeCycle] = categoryLimit
            }
        }
    }
    func sortbyDate(categoryName: String, startDate: Date, endDate: Date) -> [ConsumedItem] {
        let itemSortedbyDate = getCategoryItemsFiltered(categoryName: categoryName,
                                                        startDate: startDate, endDate: endDate)
            .sorted(by: { $0.consumedDate > $1.consumedDate })
        print(itemSortedbyDate)
        return itemSortedbyDate
    }
    func sortbyPrice(categoryName: String, startDate: Date, endDate: Date) -> [ConsumedItem] {
        let itemSortedbyPrice = getCategoryItemsFiltered(categoryName: categoryName,
                                                         startDate: startDate, endDate: endDate)
            .sorted(by: { $0.consumedPrice > $1.consumedPrice })
        print(itemSortedbyPrice)
        return itemSortedbyPrice
    }
}
