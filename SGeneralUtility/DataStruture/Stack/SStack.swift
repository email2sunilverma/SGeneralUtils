//
//  SStack.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 26/05/24.
//

import Foundation

struct SStack<T> {
    private var items = [T]()
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    // MARK: TOP ITEM
    var top: T? {
        items.last
    }
    //MARK: PUSH
    mutating func push(item: T) {
        items.append(item)
    }
    
    //MARK: POP
    mutating func pop() -> T? {
        if items.isEmpty {
            return nil
        }
        return items.removeLast()
    }
    //MARK: Displayed stack
    func displayStack() -> String {
        return "Stack Items: \(items)"
    }
}
