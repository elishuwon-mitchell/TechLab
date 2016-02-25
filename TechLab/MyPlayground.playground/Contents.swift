//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var a = false;

!a;

str.characters.last;

var test = "2552fsf25";


var value: String = "";

var stringWithoutDigit = (test.componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet()) as NSArray).componentsJoinedByString("");


var tempName = ("Jon S").stringByTrimmingCharactersInSet( NSCharacterSet.whitespaceAndNewlineCharacterSet());

tempName.containsString(" ");


var t: NSString = "e0";
var y = t.substringToIndex(1);
var h: Int = Int(t.characterAtIndex(0));


let timeString = String(format: "%02d:%02d:00", 12, 6);

test.substringToIndex(test.startIndex.advancedBy(1))

var d = Int(value);