//
//  SLinkListViewModel.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 26/05/24.
//

import Foundation

protocol LinkListProtocol<T> {
    associatedtype T: Equatable
    var head: SNode<T>? {get}
    var isEmpty: Bool {get}
    var last: SNode<T>? {get}
    func insertAtLast(item: T)
    func removeLastItem() -> T?
    func insertItemAt(item: T, index: Int) throws
    func removeItemAt(index: Int) throws -> T?
    func removeItem(item: T) -> T?
    func reverseList()
    func displayItems() -> String
}

class SLinkListViewModel: LinkListProtocol {
    typealias T = Int
    private let linklist: SLinkedList<T>
    init() {
        linklist = SLinkedList<T>()
    }
    var head: SNode<Int>? {
        linklist.head
    }
    
    var isEmpty: Bool {
        linklist.isEmpty
    }
    
    var last: SNode<Int>? {
        linklist.last
    }
    
    func insertAtLast(item: Int) {
        linklist.insertAtLast(item: item)
    }
    
    func removeLastItem() -> Int? {
        linklist.removeLastItem()
    }
    
    func insertItemAt(item: Int, index: Int) throws {
        try linklist.insertItemAt(item: item, index: index)
    }
    
    func removeItemAt(index: Int) throws -> Int? {
        try linklist.removeItemAt(index: index)
    }
    
    func removeItem(item: Int) -> Int? {
        linklist.removeItem(item: item)
    }
    
    func reverseList() {
       _ = linklist.removeLastItem()
    }
    
    func displayItems() -> String {
        linklist.displayItems()
    }
    
    
    
}
