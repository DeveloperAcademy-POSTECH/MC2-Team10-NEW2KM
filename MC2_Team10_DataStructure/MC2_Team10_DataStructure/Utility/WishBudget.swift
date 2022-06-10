//
//  WishBudget.swift
//  MC2_Team10_DataStructure
//
//  Created by Junyeong Park on 2022/06/09.
//

import Foundation

func getRestMoney() -> Int {
    let total = wishData.wishPrice
    let fixed = wishData.fixedSaving * wishData.challengeCnt
    let totalSaved = categoryPaymentsData.map{$0.PaymentSavings.reduce(0, +)}.reduce(0, +)
    return total - fixed - totalSaved
    // getRestMoney만 모으면 된다.
}
