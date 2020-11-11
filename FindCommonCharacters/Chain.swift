//
//  Chain.swift
//  FindCommonCharacters
//
//  Created by Frank McAuley on 11/10/20.
//

import Foundation

class ChainNode<T> {
    var value: T?
    var prev: ChainNode?
    var next: ChainNode?
}

class Chain<T: Equatable> {
    var head: ChainNode<T>
    init(){
        head = ChainNode<T>()
    }
    
    func insert(_ tValue: T) {
        guard head.value != nil else {
            head.value = tValue
            return
        }
        
        let nextChild = ChainNode<T>()
        
        var current = head
        while current.next != nil {
            if let currentNext = current.next{
                current = currentNext
            }
        }
        nextChild.value = tValue
        current.next = nextChild
        nextChild.prev = current
    }
    
    func search(_ tValue: T) -> T? {
        
        if head.value == tValue {
            return head.value
        }
        
        var current = head
        while current.next != nil {
            if let currentNext = current.next {
                if currentNext.value == tValue{
                    return currentNext.value
                } else {
                    current = currentNext
                }
            }
        }
        return nil
    }
    
    func count() -> Int {
        guard head.value != nil else {
            return 0
        }
        
        var counter = 0
        var current = head
        while current.value != nil {
            counter += 1
            if let currentNext = current.next{
                current = currentNext
            } else {
                break
            }
        }
        
        return counter
    }
    
}

