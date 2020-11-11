//
//  FindCommonCharactersTests.swift
//  FindCommonCharactersTests
//
//  Created by Frank McAuley on 11/5/20.
//

import XCTest
@testable import FindCommonCharacters

class FindCommonCharactersTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThatCommonCharactersIsNotNil() throws {
        let cc = CommonCharacters()
        XCTAssertNotNil(cc)
    }
    
    func testThatGivenAnEmptyArrayThefindDuplicateCharactersWillreturnAnEmptyArray() {
        let fcc = CommonCharacters()
        let input = [String]()
        let output = fcc.findCommonChars(input)
        XCTAssertEqual([], output)
    }

    func testThatGivenAnArrayOfThreeWordsTheDuplocatesCharactersWillBeReturned() {
        let fcc = CommonCharacters()
        let input = ["cool","lock","cook"]
        let expected = ["c","o"]
        let output = fcc.findCommonChars(input)
        XCTAssertEqual(expected, output)
    }
}
