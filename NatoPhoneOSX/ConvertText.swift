//
//  convertText.swift
//  NatoPhoneOSX
//

import Foundation

class ConvertText {

    func textToChars(text: String) -> [String] {
        return wordsToChars(textToWords(text))
    }

    func textToWords(text: String) -> [String] {
        return text.lowercaseString.componentsSeparatedByString(" ")
    }

    func wordsToChars(words: [String] ) -> [String] {
        var letters = [String]()
        for word in words {
            for char in word.characters {
                letters.append(String(char))
            }
            letters.append(" ")
        }
        if letters.count > 0 {
            letters.removeLast()
        }
        return letters
    }

}




