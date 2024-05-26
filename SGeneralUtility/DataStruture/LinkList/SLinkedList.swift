//
//  SLinkedList.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 26/05/24.
//

import Foundation

enum SQueueError: Error {
    case indexOverFlow
    case indexUnderFlow
    case itemNotFound
}
class SNode<T: Equatable> {
    var value: T
    var next: SNode<T>?
    init(value: T) {
        self.value = value
    }
}

class SLinkedList<T: Equatable> {
    var head: SNode<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    var last: SNode<T>? {
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        return node
    }
    func insertAtLast(item: T) {
        let node = SNode(value: item)
        if let lastNode = last {
            lastNode.next = node
        }else {
            head = node
        }
    }
    
    func removeLastItem() -> T? {
        let lastItem = last
        if head?.next == nil {
            head = nil
            return lastItem?.value
        }
        var previousNode = head
        while previousNode?.next?.next != nil {
            previousNode = previousNode?.next
        }
        previousNode?.next = nil
        return lastItem?.value
    }
    
    func insertItemAt(item: T, index: Int) throws {
        print("INDEX : \(index)")
        if index < 0 {
            throw SQueueError.indexUnderFlow
        }
        let node = SNode(value: item)
        var currentNode = head
        var currentIndex = 0
        if index == 0 {
            node.next = head
            head = node
            return
        }
        while currentIndex < index - 1 && currentNode?.next != nil {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        if currentIndex == index - 1 {
            node.next = currentNode?.next
            currentNode?.next = node
        }else {
          throw  SQueueError.indexOverFlow
        }
    }
    
    func removeItemAt(index: Int) throws -> T? {
        print("INDEX : \(index)")
        if index < 0 {
            throw SQueueError.indexUnderFlow
        }

        if index == 0 {
            let nodeToRemove = head
            head = nodeToRemove?.next
            return nodeToRemove?.value
        }
        var previousNode = head
        var currentIndex = 0
        while currentIndex < index - 1 && previousNode?.next != nil {
            previousNode = previousNode?.next
            currentIndex += 1
        }
        
        if currentIndex == index - 1 {
            let nodeToRemove = previousNode?.next
            previousNode?.next = nodeToRemove?.next
            return nodeToRemove?.value
        }else {
            throw  SQueueError.indexOverFlow
        }
    }
    
    func removeItem(item: T) -> T? {
        
        var currentItem = head
        if item == currentItem?.value {
            head = currentItem?.next
            return currentItem?.value
        }
        var prevItem: SNode<T>? = nil
        while currentItem?.next != nil  {
            prevItem = currentItem
            currentItem = currentItem?.next
            if currentItem?.value == item {
                break
            }
        }
        prevItem?.next = currentItem?.next
        return currentItem?.value
    }
    
    func reverseList() {
        var currentNode = head
        var prevNode:SNode<T>? = nil
        while currentNode != nil {
          let nextNode = currentNode?.next
            currentNode?.next = prevNode
            prevNode = currentNode
            currentNode = nextNode
        }
        head = prevNode
    }
    
    func displayItems() -> String {
        var items = [String]()
        if !isEmpty {
            var node = head
            items.append("\(String(describing: node!.value))")
            while node?.next != nil {
                node = node?.next
                items.append("\(String(describing: node!.value))")
            }
        }
        return " Items  : \(items)"
    }
}
