//
//  ViewController.swift
//  TechLab
//
//  Created by template on 1/12/16.
//  Copyright © 2016 template. All rights reserved.
//
import Cocoa

class ViewController: NSViewController{
    
    //Instance variables
    
    //MARK: - Text Fields
    @IBOutlet var projectName: NSTextField!
    @IBOutlet var name: NSTextField!
    @IBOutlet var phoneNumber: NSTextField!
    @IBOutlet var netId: NSTextField!
    @IBOutlet var usage: NSTextField!
    @IBOutlet var fileLocation: NSTextField!
    
    //MARK: - Pop Up Buttons
    @IBOutlet var printer: NSPopUpButton!
    @IBOutlet var color: NSPopUpButton!
    @IBOutlet var resolution: NSPopUpButton!
    @IBOutlet var infill: NSPopUpButton!
    @IBOutlet var supports: NSPopUpButton!
    @IBOutlet var raft: NSPopUpButton!
    @IBOutlet var schoolList: NSPopUpButton!
    @IBOutlet var hours: NSComboBox!
    @IBOutlet var minutes: NSComboBox!
    @IBOutlet var purpose: NSPopUpButton!
    
    //MARK: - Instances for right side of window
    @IBOutlet var infoTable: NSTableView!
    @IBOutlet var rightSideTitle: NSTextField!
    @IBOutlet var totalNumberOfFiles: NSTextField!
    @IBOutlet var totalUsage: NSTextField!
    @IBOutlet var totalPrice: NSTextField!
    var numberArray = [Double]();
    
    //MARK: - Arrays to store the info of the different files
    var fileCol = [String]()
    var usageCol = [String]()
    var priceCol = [String]()
    var timeCol = [String]()
    var allMyInfo = [String]();
    var arrayOfFileLocations = [String]();
    
    //MARK: - Other useful intance variables
    var printFileName: NSString = "";
    
    //MARK: - User inputted string values
    var projectNameSelection: NSString = "";
    var nameSelection: NSString = "";
    var phoneNumberSelection: NSString = "";
    var netIdSelection: NSString = "";
    var schoolSelection: NSString = "";
    var printerSelection: NSString = "";
    var colorSelection: NSString = "";
    var resolutionSelection = "";
    var raftSelection:NSString = "";
    var supportSelection:NSString = "";
    var infillSelection:NSString = "";
    
    var usageValue: Int = 0;
    var usageType: String = "";
    var usageSelection: String = "";
    
    
    var gramSelection: Bool = true;
    var mLSelection: Bool = false;
    var timeSelection: NSString = "";
    var awarenessSelection: NSString = "";
    var orientationSelection: NSString = "";
    var baseSelection: NSString = "";
    var purposeSelection: NSString = "";
    var fileLocationSelection: NSString = "";
    var dateString: NSString = "";
    
    
    @IBOutlet weak var usageLabel: NSTextField!
    @IBOutlet weak var timeLabel: NSTextField!
    @IBOutlet weak var fileLabel: NSTextField!
    @IBOutlet var netIdLabel: NSTextField!
    @IBOutlet var nameLabel: NSTextFieldCell!
    @IBOutlet var printerLabel: NSTextField!
    
    //MARK: - Array for holding print order objects
    var printOrderArray = [PrintOrder]();
    var mainWindow: MainViewController?;
    
    
    //MARK: - methods for populating the drop down menu buttons on the main window
    //------------------------------------Add Printer List-------------------------------------------------------
    func doAddItemsToPrintList() -> Void{
        printer.addItemsWithTitles(["Replicator", "Form1+", "TAZ", "Polar3D" ]);
    }
    //------------------------------------Add Color List---------------------------------------------------------
    
    func doAddItemsToColorList() -> Void{
        color.addItemsWithTitles(["white", "black", "clear", "grey", "red", "blue", "green", "orange"])
    }
    //------------------------------------Add Infill List----------------------------------------------------------
    func doAddItemsToInfillList() -> Void{
        infill.addItemsWithTitles(["10%", "20%", "30%", "40%", "50%", "60%","70%", "80%","90%", "100%"]);
    }
    
    //------------------------------------Add Support Option------------------------------------------------------
    func doAddItemsToSupportList() -> Void{
        supports.addItemsWithTitles(["Yes", "No"]);
    }
    
    //------------------------------------Add Raft Option---------------------------------------------------------
    func doAddItemsToRaftList() -> Void{
        raft.addItemsWithTitles(["Yes", "No"]);
    }
    
    //------------------------------------Add Resolution List-----------------------------------------------------
    func doAddItemsToResolutionList() -> Void{
        resolution.addItemsWithTitles([".3", ".2", ".1", ".05", ".025"]);
    }
    //------------------------------------Add Schools List-----------------------------------------------------
    func doAddItemsToSchoolList() -> Void{
        schoolList.addItemsWithTitles(["Emory College", "Staff", "Oxford College", "Business", "Law", "Medicine", "Nursing", "Public Health", "Theology", "Laney"]);
    }
    //------------------------------------Add Purpose List-----------------------------------------------------
    
    func doAddItemsToPurposeList() -> Void{
        purpose.addItemsWithTitles(["Personal Use","Academic Use"]);
    }
    //------------------------------------Add Minutes List-----------------------------------------------------
    
    func doAddItemsToMinutesList()-> Void {
        for i in 0...59{
            minutes.addItemsWithObjectValues([i]);
        }
    }
    //------------------------------------Add Hours List-----------------------------------------------------
    
    func doAddItemsToHoursList()-> Void {
        for i in 0...100{
            hours.addItemsWithObjectValues([i])
        }
    }
    //------------------------------------View Did Load-------------------------------------------------------
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.doAddItemsToPrintList();
        self.doAddItemsToColorList();
        self.doAddItemsToInfillList();
        self.doAddItemsToResolutionList();
        self.doAddItemsToSupportList();
        self.doAddItemsToRaftList();
        self.doAddItemsToSchoolList();
        self.doAddItemsToPurposeList();
        self.doAddItemsToMinutesList();
        self.doAddItemsToHoursList();
        
        
    }
    
    
    //------------------------------------Clear All Selection------------------------------------------------------
    
    @IBAction func clearAll(sender: AnyObject) {
        
        projectName.stringValue = "";
        name.stringValue = "";
        phoneNumber.stringValue = "";
        netId.stringValue = "";
        usage.stringValue = "";
        fileLocation.stringValue = "";
        
        self.doAddItemsToPrintList();
        self.doAddItemsToColorList();
        self.doAddItemsToInfillList();
        self.doAddItemsToResolutionList();
        self.doAddItemsToSupportList();
        self.doAddItemsToRaftList();
        self.doAddItemsToSchoolList();
        self.doAddItemsToPurposeList();
        
        hours.stringValue = "0";
        minutes.stringValue = "0";
        
        usageLabel.textColor = NSColor.blackColor();
        timeLabel.textColor = NSColor.blackColor();
        fileLabel.textColor = NSColor.blackColor();
        
        rightSideTitle.stringValue = "";
        totalNumberOfFiles.stringValue = "";
        totalPrice.stringValue = "";
        totalUsage.stringValue = "";
        
        fileCol.removeAll(keepCapacity: true);
        usageCol.removeAll(keepCapacity: false);
        priceCol.removeAll(keepCapacity: true);
        timeCol.removeAll(keepCapacity: true);
        numberArray.removeAll(keepCapacity: true);
        arrayOfFileLocations.removeAll(keepCapacity: true);
        allMyInfo.removeAll(keepCapacity: true);
        
        infoTable.reloadData();
        
        
    }
    
    //------------------------------------Browse For File-------------------------------------------------------
    
    @IBAction func browse(sender: AnyObject) {
        
        let panel = NSOpenPanel();
        panel.allowsMultipleSelection = false;
        panel.canChooseFiles = true;
        panel.canChooseDirectories = false;
        panel.runModal();
        var filePath: NSURL?;
        
        
        if (!panel.URLs.isEmpty){
            filePath = NSURL(fileURLWithPath: panel.URLs[0].path!)
        }
        
        // let tempString: String = (filePath?.lastPathComponent!.pathExtension)!;
        let tempString = filePath?.pathExtension;
        
        
        
        //Input validation for the file extension.
        if (tempString == "thing" || tempString == "amf" || tempString == "form"){
            
            fileLocation.stringValue = filePath!.path!// as String;
            fileLabel.textColor = NSColor.blackColor();
            
        }
        else if (tempString == ""){
            return
        }
        else{
            
            let fileExtensionErrorPopUp = NSAlert();
            fileExtensionErrorPopUp.messageText = "\tInvalid file extension error\n\nPlease choose a file with one of the following extensions: \n\n .thing (Makerbot) \n .form (PreFrom) \n .amf   (Cura)"
            fileExtensionErrorPopUp.runModal();
            fileLabel.textColor = NSColor.redColor();
        }
        
        
    }
    
    
    
    
    //------------------------------------Add-------------------------------------------------------
    //gathers all the user entered information
    @IBAction func addFile(sender: AnyObject) {
        
        printerSelection = printer.titleOfSelectedItem!;
        nameSelection = name.stringValue;
        colorSelection = color.titleOfSelectedItem!;
        infillSelection = infill.titleOfSelectedItem!;
        supportSelection = supports.titleOfSelectedItem!;
        raftSelection = raft.titleOfSelectedItem!;
        resolutionSelection = resolution.titleOfSelectedItem!;
        schoolSelection = schoolList.titleOfSelectedItem!;
        netIdSelection = netId.stringValue;
        
        usageSelection = usage.stringValue;
        timeSelection = hours.stringValue + ":" + minutes.stringValue + ":00";
        
        
        projectNameSelection = projectName.stringValue;
        phoneNumberSelection = phoneNumber.stringValue;
        fileLocationSelection = fileLocation.stringValue;
        purposeSelection = purpose.titleOfSelectedItem!;
        
        
        let today: NSDate = NSDate();
        let dateFormat: NSDateFormatter = NSDateFormatter();
        dateFormat.setLocalizedDateFormatFromTemplate("MM/dd/yyyy");
        dateString = dateFormat.stringFromDate(today);
        
        
        
        let nameError = NSAlert();
        nameError.accessoryView = NSView.init(frame: NSRect(x: 0, y: 0, width: 350, height: 0));
        nameError.messageText = "\t\t\t\t\t😱";
        
        //---Name Validation: Checks whether the user entered their full name, first and last name
        let tempName = (nameSelection as String).stringByTrimmingCharactersInSet( NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(!tempName.containsString(" ")){
            
            nameLabel.textColor = NSColor.redColor();
            nameError.messageText = "\n\tPlease enter your first and last name: \n\t\t ex: Daenerys Targaryen";
        }else{
            nameLabel.textColor = NSColor.blackColor();
        }
        
        
        //---Net Id Validation: Checks wheter the user entered their netID correctly
        if(netIdSelection.length == 0 || Int(netIdSelection.substringToIndex(1)) != nil){
            nameError.messageText = nameError.messageText + "\n\n\t Please enter your NetID: \n\t\t ex: dtarg34";
            netIdLabel.textColor = NSColor.redColor();
        }
        else{
            netIdLabel.textColor = NSColor.blackColor();
            
        }
        
        //If there was an error with the name or netID, run the error popup alert
        if(nameError.messageText != "\t\t\t\t\t😱"){
            nameError.runModal();
            return;
        }
        
        
        
        if ( (projectNameSelection as String).characters.count == 0) {
            projectNameSelection = "Please Choose a Project Name";
        }
        
        
        
        //---The following code validates the user input for the usage, time, and file fields
        
        let inputErrorPopUp = NSAlert();
        inputErrorPopUp.accessoryView = NSView.init(frame: NSRect(x: 0, y: 0, width: 350, height: 0));
        var usageInputError = ""
        var timeInputError = "";
        var fileInputError = "";
        var inputErrorAlert = false;
        
        
        //---Usage input validation
        
        for char in (usageSelection as String).characters{
            //If the character is not a number or a decimal point, an error message will be generated.
            if(  (char >= "\u{30}" && char <= "\u{39}") || char == "\u{2E}"){
                usageLabel.textColor = NSColor.blackColor();
                continue;
            }
            else{
                usageInputError = "--> Please enter only numbers or decimals into the usage section.";
                usage.stringValue = "";
                usageLabel.textColor = NSColor.redColor();
                inputErrorAlert = true;
                break;
            }
            
        }
        //If the user did not enter any information in the usage section
        if(usageSelection == ""){
            usageInputError = "--> Please input the estimated material usage.";
            usageLabel.textColor = NSColor.redColor();
            inputErrorAlert = true;
            
        }
        
        //---Time input validation
        
        let hoursAndMinutes = hours.stringValue + minutes.stringValue;
        for char in hoursAndMinutes.characters{
            //If the user entered 0 hours and 00 minutes
            
            //If the character is not a number, the error message will be generated
            if( char >= "\u{30}" && char <= "\u{39}"){
                timeLabel.textColor = NSColor.blackColor();
                continue;
            }
            else{
                timeInputError = "--> Please enter only numbers in the time section.";
                hours.stringValue = "0";
                minutes.stringValue = "0";
                timeLabel.textColor = NSColor.redColor();
                inputErrorAlert = true;
                break;
            }
        }
        if( Int(hoursAndMinutes) == 0){
            timeLabel.textColor = NSColor.redColor();
            timeInputError = "--> The time of the print cannot be 0:00.";
            inputErrorAlert = true;
            
        }
        
        //If the user did not enter any information in the time section
        if(
            
            hoursAndMinutes.characters.count == 0){
                timeInputError = "--> Please enter the estimated time of the print.";
                inputErrorAlert = true;
                hours.stringValue = "0";
                minutes.stringValue = "0";
                timeLabel.textColor = NSColor.redColor();
                
                
        }
        
        //---File input validaletn
        let manager: NSFileManager = NSFileManager.defaultManager();
        //If the user did not enter or a file or entered an invalide file path, the error message will be generated
        if( (fileLocationSelection == "") || !(manager.fileExistsAtPath(fileLocationSelection as String))){
            
            fileInputError = "--> Please choose or enter a valid file.";
            inputErrorAlert = true;
            fileLocation.stringValue = "";
            fileLabel.textColor = NSColor.redColor();
        }
        else{
            fileLabel.textColor = NSColor.blackColor();
        }
        
        
        var tempArray = [usageInputError, timeInputError, fileInputError];
        var tempString = String();
        
        for i in 0...2{
            if( tempArray[i] == ""){
                continue;
            }
            else{
                tempString = tempString + tempArray[i] + "\n";
            }
        }
        //If any input error occured an alert window will open with details about the error(s)
        if(inputErrorAlert){
            inputErrorPopUp.messageText = "\t\t\t\t😱\n\t\tCorrect the following:\n\n" + tempString;
            inputErrorPopUp.runModal();
            return;
        }
        
        
        
        let printerFileError = NSAlert();
        var isPrinterFileError = false;
        printerFileError.accessoryView = NSView.init(frame: NSRect(x: 0, y: 0, width: 350, height: 0));
        
        let tempExt = fileLocationSelection.pathExtension;
        if( (tempExt == "amf" && printerSelection != "TAZ") || (tempExt == "thing" && printerSelection != "Replicator") || (tempExt == "form" && printerSelection != "Form1+")){
            printerFileError.messageText = "\t\t\t\t😱 \n\t \tPrinter and File Mismatch Error\n\nPlease make sure the file corressponds to the correct printer: \n\n .thing (Replicator) \n .form (Form1+) \n .amf   (TAZ)";
            isPrinterFileError = true;
            printerLabel.textColor = NSColor.redColor();
            fileLabel.textColor = NSColor.redColor();
        }
        
        if(isPrinterFileError){
            printerFileError.runModal();
            return;
        }
        
        
        usageLabel.textColor = NSColor.blackColor();
        timeLabel.textColor = NSColor.blackColor();
        fileLabel.textColor = NSColor.blackColor();
        printerLabel.textColor = NSColor.blackColor();
        
        let temp = " Name: \(nameSelection) \n Phone number: \(phoneNumberSelection) \n Date: \(dateString) \n NetID: \(netIdSelection) \n School: \(schoolSelection) \n \n Printer Type: \(printerSelection) \n Color Preference: \(colorSelection) \n Infill Preference: \(infillSelection) \n Supports: \(supportSelection) \n Raft: \(raftSelection) \n Resolution: \(resolutionSelection) \n \n Estimated Material Usage: \((usageSelection as String) + getUsageUnits()) \n Estimated Time to print: \(timeSelection) \n \n What is this for: \(purposeSelection)";
        
        
        allMyInfo.append(temp);
        rightSideTitle.stringValue = projectNameSelection as String;
        printFileName = fileLocationSelection.lastPathComponent;
        
        fileCol.append(printFileName as String);
        arrayOfFileLocations.append(fileLocationSelection as String);
        priceCol.append(calculatePrice());
        timeCol.append(timeSelection as String);
        
        //logic to determine whether the usage type for the print is in grams or milliliters
        if( gramSelection){
            usageCol.append( (usageSelection as String) + "g");
            
        }
        else{
            usageCol.append( (usageSelection as String) + "mL");
           
        }
        
        
        updateVerificationInfo();
        
        
        //Insert new row in the table view
        let newRowIndex = self.fileCol.count - 1
        self.infoTable.insertRowsAtIndexes(NSIndexSet(index: newRowIndex), withAnimation: NSTableViewAnimationOptions())
        
        
        //Clears the necesseary text fields and drop down menu items so that the user may add another file to the project
        usage.stringValue = "";
        fileLocation.stringValue = "";
        hours.stringValue = "0";
        minutes.stringValue = "0";
        
        self.doAddItemsToPrintList();
        self.doAddItemsToColorList();
        self.doAddItemsToInfillList();
        self.doAddItemsToResolutionList();
        self.doAddItemsToSupportList();
        self.doAddItemsToRaftList();
        self.doAddItemsToHoursList();
        self.doAddItemsToMinutesList();
        self.doAddItemsToPurposeList();
        
    }
    //------------------------------------Remove File-------------------------------------------------------
    @IBAction func removeSelectedFile(sender: AnyObject) {
        
        
        let indexOfObjectToRemove = self.infoTable.selectedRow;
        if(indexOfObjectToRemove >= 0 && indexOfObjectToRemove < fileCol.count){
            
            fileCol.removeAtIndex(indexOfObjectToRemove);
            usageCol.removeAtIndex(indexOfObjectToRemove);
            priceCol.removeAtIndex(indexOfObjectToRemove);
            timeCol.removeAtIndex(indexOfObjectToRemove);
            numberArray.removeAtIndex(indexOfObjectToRemove);
            arrayOfFileLocations.removeAtIndex(indexOfObjectToRemove);
            allMyInfo.removeAtIndex(indexOfObjectToRemove);
            
            infoTable.removeRowsAtIndexes(NSIndexSet(index: indexOfObjectToRemove), withAnimation: NSTableViewAnimationOptions());
         
            updateVerificationInfo();
            
        }
        
    }
    
    //------------------------------------Duplicate File-------------------------------------------------------
    @IBAction func duplicateSelectedFile(sender: AnyObject) {
        
        let indexOfObjectToDuplicate = self.infoTable.selectedRow;
        
        if(indexOfObjectToDuplicate >= 0 && indexOfObjectToDuplicate < fileCol.count){
            
            fileCol.append(fileCol[indexOfObjectToDuplicate]);
            usageCol.append(usageCol[indexOfObjectToDuplicate]);
            priceCol.append(priceCol[indexOfObjectToDuplicate]);
            timeCol.append(timeCol[indexOfObjectToDuplicate]);
            numberArray.append(numberArray[indexOfObjectToDuplicate]);
            arrayOfFileLocations.append(arrayOfFileLocations[indexOfObjectToDuplicate]);
            allMyInfo.append(allMyInfo[indexOfObjectToDuplicate]);
            
            let newRowIndex = self.fileCol.count - 1;
            infoTable.insertRowsAtIndexes(NSIndexSet(index: newRowIndex), withAnimation: NSTableViewAnimationOptions());
            
            updateVerificationInfo();
            
            
        }
        
    }
    //------------------------------------Update Verification Info----------------------------------------------
    //writes out the info to the "verify" section of the right side of the window
    func updateVerificationInfo()-> Void{
        
        var totalgrams = 0.0;
        var totalmL = 0.0;
        var total2 = 0.0;
        
        totalNumberOfFiles.stringValue = "\(fileCol.count)";
        
        for item in usageCol{
            
            let temp = (item as NSString).doubleValue
            if(item.hasSuffix("g")){
                totalgrams = totalgrams + temp;
            }
            if(item.hasSuffix("mL")){
                totalmL = totalmL + temp;
            }
            
        }
        totalUsage.stringValue = "\(totalgrams)g, \(totalmL)mL";
        
        for item in numberArray{
            total2 = total2 + item;
        }
        
        totalPrice.stringValue = NSString( format: "$%.2f", total2) as String;
        
    }
    //------------------------------------Usage Units-------------------------------------------------------
    //Logic that determines whether the user selected grams of milliliters as their usage type
    @IBAction func gramUsage(sender: AnyObject) {
        
        gramSelection = true;
        mLSelection = false;
        usageType = "g";
        
    }
    @IBAction func mLUsage(sender: AnyObject) {
        
        mLSelection = true;
        gramSelection = false;
        usageType = "mL";
        
    }
    
    //------------------------------------Get Usage Units-------------------------------------------------------
    //Returns the correct units for the usage selection
    func getUsageUnits() -> String{
        if(gramSelection && !mLSelection){
            return "g";
        }
        else{
            return "mL";
        }
    }
    //------------------------------------Price Calculation--------------------------------------------------
    //calculates the price of the print job based on the amount of material used
    func calculatePrice() -> String{
        
        let temp_usageSelection:NSString = usageSelection;
        let temp_price = temp_usageSelection.doubleValue;
        
        var temp_number = 0;
        
        if (gramSelection && !mLSelection){
            if(temp_price % 100 == 0){
                temp_number =  2 *  Int(temp_price/100);
            }
            else{
                temp_number =  2 * ( 1 + Int(temp_price/100));
                
            }
        }
        else{
            if(temp_price % 100 == 0){
                temp_number =  4 *  Int(temp_price/100);
            }
            else{
                temp_number =  4 * ( 1 + Int(temp_price/100));
                
            }
        }
        numberArray.append(Double(temp_number));
        
        let priceOfPrint = "$\(temp_number).00";
        return priceOfPrint;
        
    }
    
    
    //------------------------------------Continue--------------------------------------------------
    
    @IBAction func continueToPackageWindow(sender: AnyObject) {
        
      
        
        self.performSegueWithIdentifier("PackageSegue", sender: sender)
        
        
    }
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if(arrayOfFileLocations.count == 0){
            let notification = NSAlert();
            notification.accessoryView = NSView.init(frame: NSRect(x: 0, y: 0, width: 350, height: 0));
            notification.messageText = "Please choose at least one file.";
            notification.runModal();
            return false;
            
        }
        else{
            return true;
        }
        
        
        
    }
    //------------------------------------Segue------------------------------------------------------
    
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) ->  Void {
        
        shouldPerformSegueWithIdentifier("PackageSegue", sender: self);
        
        
        let secondWindow: ViewController1 = segue.destinationController as! ViewController1;
        
        secondWindow.allMyInfo = allMyInfo;
        secondWindow.arrayOfFileNames = fileCol;
        secondWindow.arrayOfUsages = usageCol;
        secondWindow.arrayOfPrices = priceCol;
        secondWindow.arrayOfFileLocations = arrayOfFileLocations;
        secondWindow.arrayOfEstTimes = timeCol;
        
        secondWindow.netId = netIdSelection;
        secondWindow.projectName = projectNameSelection;
        secondWindow.name = nameSelection;
        secondWindow.dateString = dateString;
        secondWindow.estTime = timeSelection;
        
        secondWindow.previousWindow = self;
        
        
        
        
        for(var i = 0; i < fileCol.count; i++){
            let x: PrintOrder = PrintOrder.init(name: nameSelection as String, netID: netIdSelection as String, date: dateString as String);
            x.setOrderNumber(printOrderArray.count + 1);
            x.setfile(fileCol[i]);
            let stringArray = usageCol[i].componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet);
            let type = (usageCol[i].componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet()) as NSArray).componentsJoinedByString("");
            let value = Double(stringArray.joinWithSeparator(""));
            x.setMaterialValue(value!);
            x.setTypeOfMaterial(type);
            x.updateMaterial(usageCol[i]);
            x.updateTime(timeCol[i]);
            x.updatePrice(priceCol[i]);
            
            self.printOrderArray.append(x);
        }
        
        secondWindow.printOrderArray = self.printOrderArray;
        secondWindow.mainWindow = self.mainWindow;
        
        
        
    }
    
}



// MARK: - NSTableViewDataSource
extension ViewController: NSTableViewDataSource{
    
    
    //------------------------------------Number of rows in table view-------------------------------------------------------
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        
        return self.fileCol.count
        
    }
    
    //------------------------------------Table View-------------------------------------------------------
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        
        let view: NSTableCellView = tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: self) as! NSTableCellView
        
        
        //Inserting the file name in the file name column
        if( tableColumn!.identifier == "fileNameColumn"){
            view.textField!.stringValue = fileCol[row]
            
        }
            
            //Inserting the usage amount in the usage column
        else if( tableColumn!.identifier == "usageColumn"){
            
            
            view.textField!.stringValue = usageCol[row];
            
        }
            
            //Inserting the price of the print in the price column
        else  if( tableColumn!.identifier == "priceColumn"){
            
            view.textField!.stringValue = priceCol[row];
            
        }
            
            //Inserting the time of the print in the time column
        else {
            
            view.textField!.stringValue = timeCol[row]
            
        }
        
        return view;
        
    }
}

