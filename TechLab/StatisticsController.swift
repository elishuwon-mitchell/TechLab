//
//  StatisticsController.swift
//  TechLab
//
//  Created by template on 2/9/16.
//  Copyright © 2016 template. All rights reserved.
//

import Foundation
import Cocoa

class StatiticsController: NSViewController{
    
    
    @IBOutlet var semester: NSTextField!
    @IBOutlet var totalGram: NSTextField!
    @IBOutlet var totalML: NSTextField!
    @IBOutlet var totalPrice: NSTextField!
    @IBOutlet var uniqueUsers: NSTextField!
    
    
    
    //------------------------------------View Did Load------------------------------------------------------
    
    override func viewDidLoad() {
        
        super.viewDidLoad();
        //semester.stringValue = "Testing Semester";
        //self.storyboard!.getInstance();
        
    }
    
    @IBAction func export(sender: AnyObject) {
        
    }
    
    
    
}