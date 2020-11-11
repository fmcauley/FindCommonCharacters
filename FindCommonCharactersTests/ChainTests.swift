//
//  ChainTests.swift
//  FindCommonCharactersTests
//
//  Created by Frank McAuley on 11/10/20.
//

import XCTest
@testable import FindCommonCharacters
class ChainTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThatChainIsNotNil() throws {
        let chain = Chain<Int>()
        XCTAssertNotNil(chain)
    }
    
    func testThatChainHasAHead() {
        let chain = Chain<String>()
        XCTAssertNotNil(chain.head)
    }
    
    func testThatAValueCanBeInsertedIntoAChain() {
        let chain = Chain<Int>()
        chain.insert(42)
    }
    
    func testThatTwoValuesCanBeAdded() {
        let chain = Chain<String>()
        chain.insert("Joe")
        chain.insert("Biden")
        XCTAssertEqual("Joe", chain.search("Joe"))
        XCTAssertEqual("Biden", chain.search("Biden"))
    }
    
    func testThatValueNotPlacedIntoTheChainWillReutrnNil() {
        let chain = Chain<String>()
        XCTAssertNil(chain.search("Jimmy"))
    }
    
    func testThatThreeValuesCanBeAddedAndFound() {
        let chain = Chain<Int>()
        chain.insert(42)
        chain.insert(100)
        chain.insert(32)
        XCTAssertEqual(32, chain.search(32))
    }
    
    func testThatTheChainCanCountItsNumberOfElements(){
        let chain = Chain<String>()
        chain.insert("Frank")
        chain.insert("Frank")
        let output = chain.count()
        XCTAssertEqual(output, 2)
    }
    
    func testThatTheChainCanCountItsNumberOfElementsWhenThreeAreAdded(){
        let chain = Chain<String>()
        chain.insert("Frank")
        chain.insert("Frank")
        chain.insert("Frank")
        let output = chain.count()
        XCTAssertEqual(output, 3)
    }
    
    func testThatTheChainCanCountItsNumberOfElementsWhenFiveAreAdded(){
        let chain = Chain<String>()
        chain.insert("Frank")
        chain.insert("Frank")
        chain.insert("Frank")
        chain.insert("Frank")
        chain.insert("Frank")
        let output = chain.count()
        XCTAssertEqual(output, 5)
    }

}
