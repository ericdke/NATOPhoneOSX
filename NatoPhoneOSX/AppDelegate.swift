//
//  AppDelegate.swift
//  NatoPhoneOSX

import Cocoa
import AppKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var title: NSTextField!
    @IBOutlet weak var textIN: NSTextField!
    @IBOutlet weak var textOUT: NSTextField!
    @IBOutlet weak var popUpButton: NSPopUpButton!

    var encoder = true
    let convert = ConvertText()
    let nato = Nato()

    func applicationDidFinishLaunching(aNotification: NSNotification) {

        let darkBlue:NSColor = NSColor(red:0, green:0.29, blue:0.56, alpha:1)

        textIN.editable = false
        window.center()
        title.textColor = NSColor.whiteColor()
        textIN.textColor = NSColor.whiteColor()
        textOUT.textColor = NSColor.whiteColor()
        window.backgroundColor = NSColor.whiteColor()
        title.backgroundColor = darkBlue
        textIN.backgroundColor = darkBlue
        textOUT.backgroundColor = darkBlue
        popUpButton.removeAllItems()
        popUpButton.addItemsWithTitles(["Encode", "Decode"])
        textIN.editable = true

    }

    @IBAction func chooseAction(sender: NSPopUpButton) {

        let action = sender.titleOfSelectedItem!
        if action == "Encode" {
            encoder = true
        } else {
            encoder = false
        }

    }

    @IBAction func editField(sender: NSTextField) {

        let content = textIN.stringValue

        var response:String

        if encoder {
            let letters = convert.textToChars(content)
            let natoWords = nato.lettersToNato(letters)
            response = " ".join(natoWords)
        } else {
            let words = convert.textToWords(content)
            let letters = nato.wordsToLetters(words)
            response = "".join(letters)
        }

        textOUT.stringValue = response
    }

}

















