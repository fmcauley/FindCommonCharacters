//
//  HashTableTests.swift
//  FindCommonCharactersTests
//
//  Created by Frank McAuley on 11/10/20.
//

import XCTest
@testable import FindCommonCharacters
class HashTableTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThatHashSetHasACapacity(){
        let value = 4
        let hashSet = HashTable<Int>(capacity: value)
        XCTAssertEqual(hashSet.capacity, value)
    }
    
    func testThatTheCountOfTheHashSetWillBeOneAfterAnInsert() {
        let value = 32
        let hashSet = HashTable<Int>(capacity: value)
        let key = 23
        let expected = 1
        hashSet.insert(key: key)
        XCTAssertEqual(hashSet.keyCount, expected)
    }
    
    func testThatTheBucketContainsaValueThatWasInserted() {
        let capacity = 32
        let hashSet = HashTable<Int>(capacity: capacity)
        let key = 23
        let expected = true
        
        hashSet.insert(key: key)
        let output = hashSet.contains(key: key)
        XCTAssertEqual(output, expected)
    }
    
    func testThatTheBucketDoesNotContainsaValueThatWasInserted() {
        let value = 32
        let hashSet = HashTable<Int>(capacity: value)
        let key = 23
        let expected = false
        let output = hashSet.contains(key: key)
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatTheRemovedValueIsNoLongerContainedInTheHashTable() {
        let value = 32
        let expected = false
        let hashSet = HashTable<Int>(capacity: value)
        let key = 23
        let output = hashSet.removeValue(key: key)
        XCTAssertEqual(output, expected)
    }
    
    func testThatDuplicateWillReturnADuplicateValue() {
        let value = 32
        let hashSet = HashTable<Int>(capacity: value)
        let key = 23
        let expected = 23
        
        hashSet.insert(key: key)
        hashSet.insert(key: key)
        
        let output = hashSet.allDuplicateKeys(key: key)
        
        XCTAssertEqual(expected, output)
        
    }
    
    func testThatStingsWorkInHashTable() {
        let value = 32
        let hashSet = HashTable<String>(capacity: value)
        let key = "Joe Biden"
        let expected = true
        hashSet.insert(key: key)
        let output = hashSet.contains(key: key)
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatHasTableCanCollectACountOfItemsInAChain() {
        let value = 32
        let hashSet = HashTable<String>(capacity: value)
        let key1 = "Joe Biden"
        let key2 = "Joe Biden"
        hashSet.insert(key: key1)
        hashSet.insert(key: key2)
        let output = hashSet.itemCount(key: key2)
        XCTAssertEqual(output, 2)
    }
    
    func testThatHasTableCanCollectACountOfThreeItemsInAChain() {
        let value = 32
        let hashSet = HashTable<String>(capacity: value)
        let key = "Joe Biden"
        hashSet.insert(key: key)
        hashSet.insert(key: key)
        hashSet.insert(key: key)
        let output = hashSet.itemCount(key: key)
        XCTAssertEqual(output, 3)
    }
    
    func testThatHasTableCanReturnTheValueForAnEntryThatHasMoreThanOneValue() {
        let value = 32
        let hashSet = HashTable<String>(capacity: value)
        let key = "Joe Biden"
        hashSet.insert(key: key)
        hashSet.insert(key: key)
        hashSet.insert(key: key)
        let output = hashSet.allDuplicateKeys(key: key)
        XCTAssertEqual(key, output)
    }
}
