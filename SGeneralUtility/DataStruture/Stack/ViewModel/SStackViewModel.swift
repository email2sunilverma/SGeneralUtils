//
//  SStackViewModel.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 26/05/24.
//

import Foundation


protocol STackProtocol<T> {
    associatedtype T
    var isEmpty: Bool {get}
    var top: T? {get}
    func push(item: T)
    func pop() -> T?
    func displayStack() -> String
}

class SStackViewModel: STackProtocol {
    
    typealias T = Int
    private var stack: SStack<T>
    init() {
        self.stack = SStack()
    }
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    // MARK: TOP ITEM
    var top: T? {
        stack.top
    }
    //MARK: PUSH
    func push(item: T) {
        stack.push(item: item)
    }
    
    //MARK: POP
    func pop() -> T? {
        stack.pop()
    }
    //MARK: Displayed stack
    func displayStack()-> String {
        stack.displayStack()
    }
    
}
