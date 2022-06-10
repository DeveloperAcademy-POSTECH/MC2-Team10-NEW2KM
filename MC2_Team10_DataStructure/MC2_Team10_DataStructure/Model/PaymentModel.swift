//
//  PaymentModel.swift
//  MC2_Team10_DataStructure
//
//  Created by Junyeong Park on 2022/06/09.
//

import Foundation

struct PaymentModel: Identifiable, Codable {
    var id = UUID()
    var challengeCnt: Int
    var paymentCategory: String
    var payment: Int
    var paymentName: String
    var paymentDate: Date
    var paymentMemo: String
}
