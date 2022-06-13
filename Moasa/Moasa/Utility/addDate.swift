//
//  addDate.swift
//  Moasa
//
//  Created by Kelly Chui on 2022/06/13.
//

import Foundation

func addDate(date: Date, days: Int) -> Date {
    return Calendar.current.date(byAdding: .day, value: days, to: date)!
}
