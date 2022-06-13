//
//  Keyboard+Extension.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/13.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
