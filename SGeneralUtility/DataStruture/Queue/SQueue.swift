//
//  SQueue.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 26/05/24.
//

import Foundation

struct SQueue<T>{
    private var items = [T]()
    
    var isEmpty: Bool {
        items.isEmpty
    }
    // MARK: TOP ITEM
    var top: T? {
        items.first
    }
    // MARK: ENQUEUE
    mutating func enqueue(item: T) {
        items.append(item)
    }
    //MARK: DEQUEUE
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        }
        return items.removeFirst()
    }
    
    //MARK: DIsplay Items
    func displayQueue() -> String {
        return "Queue Items: \(items)"
    }
}
