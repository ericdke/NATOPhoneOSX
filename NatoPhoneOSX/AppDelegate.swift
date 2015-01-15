//
//  AppDelegate.swift
//  NatoPhoneOSX
//
//  Created by ERIC DEJONCKHEERE on 28/09/2014.
//  Copyright (c) 2014 ERIC DEJONCKHEERE. All rights reserved.
//

import Cocoa
import AppKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var title: NSTextField!
    @IBOutlet weak var textIN: NSTextField!
    @IBOutlet weak var textOUT: NSTextField!
    @IBOutlet weak var popUpButton: NSPopUpButton!
    
    var encoder:Bool = true
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        
        let lightBlue:NSColor = NSColor(red:0, green:0.55, blue:0.79, alpha:1)
        let darkBlue:NSColor = NSColor(red:0, green:0.29, blue:0.56, alpha:1)
        
        textIN.editable = false
        window.center()
        title.textColor = NSColor.whiteColor()
        textIN.textColor = NSColor.whiteColor()
        textOUT.textColor = NSColor.whiteColor()
        window.backgroundColor = lightBlue
        title.backgroundColor = darkBlue
        textIN.backgroundColor = darkBlue
        textOUT.backgroundColor = darkBlue
        popUpButton.removeAllItems()
        popUpButton.addItemsWithTitles(["Encode", "Decode"])
        textIN.editable = true
        
    }
    
    @IBAction func chooseAction(sender: AnyObject) {

        let action: String = sender.titleOfSelectedItem!!
        if action == "Encode" {
            encoder = true
        }else{
            encoder = false
        }
        
    }
    
    @IBAction func editField(sender: NSTextField) {
        
        let content:String = textIN.stringValue
        
        let convert = convertText()
        let nato = Nato()
        
        var response:String = ""
        
        if encoder == true {
            let letters = convert.textToChars(text: content)
            let natoWords = nato.lettersToNato(letters: letters)
            response = join(" ", natoWords)
        }else{
            let words:[String] = convert.textToWords(text: content)
            let letters:[String] = nato.wordsToLetters(nato: words)
            response = join("", letters)
        }
        
        textOUT.stringValue = response
    }
    
}

