//
//  AppDelegate.swift
//  TechLab
//
//  Created by template on 1/12/16.
//  Copyright © 2016 template. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainVC = MainViewController();

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    //Added this method so that the app will quit when the main window is closed.
    //This prevents the user from having to click on icon on the dock or from the menu bar in order to quit the app.
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true;
    }
    
    func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) ->  Void {
        let mainTable = MainViewController();
//        let stats = segue.destinationController as! StatiticsController;
//        
//        var price = 0;
//        var gram = 0.0;
//        var mL = 0.0;
//        var isGram = true;
//        
//        for x in mainTable.printOrderArray{
//            price = price + Int(x.price!)!;
//            let type = x.materialType;
//            if(type?.characters.last == "L" ){
//                isGram = false;
//            }
//            
//            if(isGram){
//                gram  = gram + x.materialValue!;
//                print(gram);
//            }
//            else{
//                mL = mL + x.materialValue!;
//            }
//            
//            
//        }
//        
//        
//        stats.totalGram.stringValue = "\(gram)";
//        stats.totalML.stringValue = "\(mL)";
//        stats.totalPrice.stringValue = "\(price)";
        
        print(mainTable.printOrderArray);
    }

    @IBAction func viewStats(sender: AnyObject) {
        
        let s = NSStoryboardSegue.init(identifier: "StatsSegue", source: self, destination: StatiticsController());
        self.prepareForSegue(s, sender: self);

        
    }
}

