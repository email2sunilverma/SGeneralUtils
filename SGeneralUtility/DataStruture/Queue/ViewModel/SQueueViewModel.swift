//
//  SQueueViewModel.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 26/05/24.
//

import Foundation

protocol SQueueProtocol<T> {
    associatedtype T
    var isEmpty: Bool {get}
    var top: T? {get}
    func enqueue(item: T)
    func dequeue() -> T?
    func displayQueue() -> String
}

class SQueueViewModel: SQueueProtocol {
    typealias T = Int
    private var queue: SQueue<T>
    init() {
        self.queue = SQueue()
    }
    var isEmpty: Bool {
        queue.isEmpty
    }
    var top: Int? {
        queue.top
    }
    func enqueue(item: Int) {
        queue.enqueue(item: item)
    }
    func dequeue() -> Int? {
        queue.dequeue()
    }
    func displayQueue() -> String {
        queue.displayQueue()
    }
}
