//
//  CategoryPaymentModel.swift
//  MC2_Team10_DataStructure
//
//  Created by Junyeong Park on 2022/06/09.
//

import Foundation

struct CategoryPaymentModel: Identifiable, Codable {
    var id = UUID()
    var category: String
    var paymentLimit: Int
    var payments: [PaymentModel]
    var challengeCnt: Int
    
    // Computed Property
    
    var paymentSpent: Int {
        return payments.filter{$0.challengeCnt == challengeCnt}.map{$0.payment}.reduce(0, +)
    }
    
    var paymentSaved: Int {
        return paymentLimit - paymentSpent
    }
    
    var PaymentSavings: [Int] {
        var paymentSavings = [Int]()
        for challengeCnt in 0...challengeCnt {
            paymentSavings.append(payments.filter{$0.challengeCnt == challengeCnt}.map{$0.payment}.reduce(0, +))
        }
        return paymentSavings
    }
}
