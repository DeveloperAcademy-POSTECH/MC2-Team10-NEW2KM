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
                var targetItems = try JSONDecoder().decode([TargetItem].self, from: data)
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
