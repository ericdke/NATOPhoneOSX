//
//  Nato.swift
//  NatoPhoneOSX
//
//  Created by ERIC DEJONCKHEERE on 28/09/2014.
//  Copyright (c) 2014 ERIC DEJONCKHEERE. All rights reserved.
//

import Cocoa

class Nato: NSObject {

    let encode: [Character:String] = ["a": "alpha", "b": "bravo", "c": "charlie", "d": "delta", "e": "echo", "f": "foxtrot", "g": "golf", "h": "hotel", "i": "india", "j": "juliet", "k": "kilo", "l": "lima", "m": "mike", "n": "november", "o": "oscar", "p": "papa", "q": "quebec", "r": "romeo", "s": "sierra", "t": "tango", "u": "uniform", "v": "victor", "w": "whiskey", "x": "x-ray", "y": "yankee", "z": "zulu", "0": "zero", "1": "one", "2": "two", "3": "three", "4": "four", "5": "five", "6": "six", "7": "seven", "8": "eight", "9": "niner", " ": "-", ".": "stop"]

    let decode: [String:Character] = ["alpha": "a", "bravo": "b", "charlie": "c", "delta": "d", "echo": "e", "foxtrot": "f", "golf": "g", "hotel": "h", "india": "i", "juliet": "j", "kilo": "k", "lima": "l", "mike": "m", "november": "n", "oscar": "o", "papa": "p", "quebec": "q", "romeo": "r", "sierra": "s", "tango": "t", "uniform": "u", "victor": "v", "whiskey": "w", "x-ray": "x", "yankee": "y", "zulu": "z", "zero": "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "niner": "9", "-": " ", "stop": "."]

    let preserved: [Character] = ["!", "?"]

    func lettersToNato(#letters: [Character]) -> [String] {
        var bogies = [String]()
        for letter in letters {
            if let word = encode[letter] {
                bogies.append(word)
            } else {
                for pre in preserved {
                    if letter == pre {
                        bogies.append(String(letter))
                        break
                    }
                }
            }
        }
        return bogies
    }

    func wordsToLetters(#nato: [String]) -> [String] {
        var res = [String]()
        for word in nato {
            if let char = decode[word] {
                res.append(String(char))
            }
        }
        return res
    }

}






