//
//  Optional+Extension.swift
//  ToDoRightNow
//
//  Created by Dima Bonder on 20/06/2022.
//

import Foundation

public extension Optional where Wrapped: Collection {
    func nilOrEmpty() -> Bool {
        guard let value = self else { return true }
        return value.isEmpty
    }

    func hasElements() -> Bool {
        var empty = false
        if let str = self as? String {
            empty = str.trimmingCharacters(in: .whitespaces).isEmpty
        }
        return !nilOrEmpty() && !empty
    }
}
