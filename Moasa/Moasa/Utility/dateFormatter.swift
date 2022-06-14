//
//  DateFormatter.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/12.
//

import Foundation

func dateFormatter(date: Date, format: String = "M월 dd일") -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format // Default Value 3월 26일
    return dateFormatter.string(from: date)
}

func datetoInteger(date: Date) -> Int {
    let stringBuf: String = dateFormatter(date: date, format: "yyMMDD")
    if let returnValue = Int(stringBuf) {
        return returnValue
    } else {
        return 0
    }
}
