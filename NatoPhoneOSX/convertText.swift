//
//  convertText.swift
//  NatoPhoneOSX
//
//  Created by ERIC DEJONCKHEERE on 28/09/2014.
//  Copyright (c) 2014 ERIC DEJONCKHEERE. All rights reserved.
//

import Cocoa

class convertText: NSObject {
    
    func textToChars(#text:String) -> Array<Character> {
        return wordsToChars(words: textToWords(text: text))
    }
    
    func textToWords(#text:String) -> Array<String> {
        let down:String = text.lowercaseString
        let bucket = split(down, {$0==" "}, allowEmptySlices: false)
        return bucket
    }
    
    func wordsToChars(#words:Array<String>) -> Array<Character> {
        var letters:Array<Character> = []
        for word in words {
            for char in word {
                letters.append(char)
            }
            letters.append(" ")
        }
        if letters.count > 0 {
            letters.removeLast()
        }
        return letters
    }
    
}




