//
//  HashTable.swift
//  FindCommonCharacters
//
//  Created by Frank McAuley on 11/10/20.
//

import Foundation

public class HashTable <T: Equatable> {
    private var buckets: Array<Chain<T>?>
    private var slots: Int = 0
    private var count = 0
    private var duplicateValue: T?
    
    var keyCount : Int {
        get {
            count
        }
    }
    
    var capacity : Int {
        get {
            slots
        }
    }
    
    
    public init(capacity: Int = 16) {
        self.buckets = Array<Chain?>(repeatElement(nil, count: capacity))
        self.slots = buckets.capacity
    }
    
    func insert(key k: T) {
        let index = preHash(key: k, andCapacity: capacity)
        //buckets[index] = k as? Chain<T>
        //is there a value there already?
        if let chain: Chain = buckets[index]{
            chain.insert(k)
            count += 1
        } else {
            let newChain = Chain<T>()
            newChain.insert(k)
            buckets[index] = newChain
            count += 1
        }
    }
    
    func contains(key k: T) -> Bool {
        let index = preHash(key: k, andCapacity: capacity)
        return (buckets[index] != nil)
    }
    
    func removeValue(key k: T) -> Bool{
        let index = preHash(key: k, andCapacity: capacity)
        buckets[index] = nil
        return contains(key: k)
    }
    
    func itemCount(key k: T) -> Int {
        if contains(key: k){
            let index = preHash(key: k, andCapacity: capacity)
            if let keyCount = buckets[index]?.count(){
                return keyCount
            }
        }
       return 0
    }
    
    func allDuplicateKeys(key k: T) -> T? {
        if contains(key: k) && itemCount(key: k) > 1 {
            return k
        }
        return nil
    }
    
    
    
    //func for hashing a string that has bit shift
    /*
     Taken from :
     https://www.raywenderlich.com/206-swift-algorithm-club-hash-tables
     */
    private func djb2Hash(_ string: String) -> Int {
        let unicodeScalars = string.unicodeScalars.map{ $0.value }
        return unicodeScalars.reduce(5381){
            ($0 << 5) &+ $0 &+ Int($1)
        }
    }
    
    
    //this should be private and not exposed through interface
    private func preHash(key k: T, andCapacity m: Int) -> Int {
        let a = 59389690744 //random number
        let b = 30762909936 //random number
        let p = 87178291199 //large prime fits with in the range of an unsigned integer
        var kValue: Int
        if let strValue = k as? String {
            // adding the mod capacity to get the index value
            return (djb2Hash(String(strValue)) % m)
        } else {
            kValue = k as! Int // I don't like this
            return (((a*kValue + b) % p) % m)
        }
    }
}
