//
//  Number+Extension.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/13.
//

import SwiftUI

extension View {
    func numberFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        return numberFormatter.string(from: NSNumber(value: number))!
    }
}
