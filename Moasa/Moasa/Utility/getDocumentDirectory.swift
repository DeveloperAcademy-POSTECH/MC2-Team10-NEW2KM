//
//  getDocumentDirectory.swift
//  Moasa
//
//  Created by Junyeong Park on 2022/06/16.
//

import Foundation

func getDocumentDirectory() -> URL {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return path[0]
}
