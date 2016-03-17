//
//  DisplayLabel.swift
//  Calculator
//
//  Created by sodas on 2/28/16.
//  Copyright © 2016 sodas. All rights reserved.
//

import UIKit

class DisplayLabel: UILabel {

    // MARK: - Value

    var floatValue: Float {
        get {
            if let text = self.text {
                return Float(text)!
            } else {
                return 0.0
            }
        }
        set(newValue) {
            self.text = (newValue as NSNumber).stringValue
        }
    }

    func clear() {
        self.floatValue = 0.0
    }

    func append(digit: Int) {
        if let text = self.text where text != "0" {
            self.text = text + "\(digit)"
        } else {
            self.text = (digit as NSNumber).stringValue
        }
    }

    // MARK: - Negative

    var negative: Bool {
        if let text = self.text {
            return text.hasPrefix("-")
        } else {
            return false
        }
    }

    func changeSign() {
        guard let text = self.text else {
            return
        }
        self.text = self.negative ? text.substringFromIndex(text.startIndex.advancedBy(1)) : "-" + text
    }
    
    // append decimal point
    
    var hasADot: Bool {
        return self.text?.rangeOfString(".") != nil
//        if self.text?.rangeOfString(".") != nil {
//            return true
//        } else {
//            return false
//        }
    }
    
    func dot() {
        guard let text = self.text else {
            return
        }
        self.text = self.hasADot ? text : text + "."
    }
    
    // percentage
    
    func percentage() {
        guard let text = self.text else {
            return
        }
//        var temp: String = ""
//        if self.negative {
//            temp = "-00" + text.substringFromIndex(text.startIndex.advancedBy(1))
//        } else {
//            temp = "00" + text
//        }
//        if self.hasADot {
//            // 移動小數點
//            let index = (temp.rangeOfString(".")?.startIndex)!
//            temp = temp.substringToIndex(index.advancedBy(-2)) + "." + temp.substringWithRange(Range(start: index.advancedBy(-2), end: index)) + temp.substringFromIndex(index.advancedBy(1))
//            while(temp[temp.startIndex] == "0" && temp[temp.startIndex.successor()] != "."){
//                // kill the fucking zero.
//                temp = temp.substringFromIndex(temp.startIndex.successor())
//            }
//        } else {
//            // 加小數點
//        }
        self.text = String(Float(text)! * 0.01)
    }

}
