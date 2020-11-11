//
//  CommonCharacters.swift
//  FindCommonCharacters
//
//  Created by Frank McAuley on 11/5/20.
//

import Foundation
class CommonCharacters {
    func findCommonChars(_ arr: [String]) -> [String] {
        
        guard arr.count > 0 else {
            return []
        }
        
        let hashSet = HashTable<String>()
        var returnChars = [String]()
        
        //drop all the chars in to a hashtable
        for str in arr {
            for x in str {
                let convertStr = String(x)
                hashSet.insert(key: convertStr)
            }
        }
        
        for str in arr {
            for x in str {
                let convertToStr = String(x)
                if hashSet.contains(key: convertToStr) &&
                    hashSet.itemCount(key: convertToStr) >= arr.count {
                    if let duplicateKey = hashSet.allDuplicateKeys(key: convertToStr){
                        returnChars.append(duplicateKey)
                        _ = hashSet.removeValue(key: duplicateKey)
                    }
                }
            }
        }
      
        return returnChars
    }
}
