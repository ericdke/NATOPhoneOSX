//
//  convertText.swift
//  NatoPhoneOSX
//

import Cocoa

class ConvertText: NSObject {

    func textToChars(#text: String) -> [String] {
        return wordsToChars(words: textToWords(text: text))
    }

    func textToWords(#text: String) -> [String] {
        let down = text.lowercaseString
        let bucket = down.componentsSeparatedByString(" ")
        return bucket
    }

    func wordsToChars(#words: [String] ) -> [String] {
        var letters = [String]()
        for word in words {
            for char in word {
                letters.append("\(char)")
            }
            letters.append(" ")
        }
        if letters.count > 0 {
            letters.removeLast()
        }
        return letters
    }

}




