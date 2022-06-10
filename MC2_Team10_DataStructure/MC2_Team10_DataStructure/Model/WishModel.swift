//
//  WishModel.swift
//  MC2_Team10_DataStructure
//
//  Created by Junyeong Park on 2022/06/09.
//

import Foundation

struct WishModel: Identifiable, Codable {
    var id = UUID()
    var wishName: String
    var wishPrice: Int
    var wishImageName: String = "iPhone"
    // imageName -> default. 실제 png/jpeg 다루려면 URL로 쓰거나 할 듯.
    var fixedSaving: Int
    var startDate: Date = Date.now
    // 도전 기준 날짜
    var challengeCnt: Int = 0
    // 시작 시점 입력
    
    // computed property -> 시작 시점,
    var dayCount: Int {
        let dateGap = Calendar.current.dateComponents([.month ,.day], from: startDate, to: Date.now)
        // TODO: 날짜 카운트 -> 자동 반영 되도록 하기 (목표)
        if let dayCnt = dateGap.day {
            return dayCnt
        } else {
            return -1
        }
    }
}
