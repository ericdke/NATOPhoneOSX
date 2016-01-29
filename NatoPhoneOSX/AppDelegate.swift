//
//  AppDelegate.swift
//  NatoPhoneOSX

// Le code a été amélioré par rapport au tutoriel sur Aya.io lors du passage à Swift 2.2, mais les principes restent les mêmes.

import Cocoa
import AppKit

enum EncoderMode {
    case Encode, Decode
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var title: NSTextField!
    @IBOutlet weak var textIN: NSTextField!
    @IBOutlet weak var textOUT: NSTextField!
    @IBOutlet weak var popUpButton: NSPopUpButton!

    var mode: EncoderMode = .Encode
    let convert = ConvertText()
    let nato = Nato()

    func applicationDidFinishLaunching(aNotification: NSNotification) {

        let darkBlue:NSColor = NSColor(red:0, green:0.29, blue:0.56, alpha:1)
        let white = NSColor.whiteColor()

        window.center()
        textIN.editable = true
        title.textColor = white
        textIN.textColor = white
        textOUT.textColor = white
        window.backgroundColor = white
        title.backgroundColor = darkBlue
        textIN.backgroundColor = darkBlue
        textOUT.backgroundColor = darkBlue
        popUpButton.removeAllItems()
        popUpButton.addItemsWithTitles(["Encode", "Decode"])
        
    }

    @IBAction func chooseAction(sender: NSPopUpButton) {

        if let action = sender.titleOfSelectedItem {
            if action == "Encode" {
                mode = .Encode
            } else {
                mode = .Decode
            }
        }

    }

    @IBAction func editField(sender: NSTextField) {

        let content = textIN.stringValue
        
        let response:String = {
            if mode == .Encode {
                let letters = convert.textToChars(content)
                return nato.sentenceFromLetters(letters)
            } else {
                let words = convert.textToWords(content)
                return nato.wordsFromNato(words)
            }
        }()

        textOUT.stringValue = response
    }

}

















