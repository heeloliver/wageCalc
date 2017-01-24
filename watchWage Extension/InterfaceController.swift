//
//  InterfaceController.swift
//  watchWage Extension
//
//  Created by Oliver Mulcahy on 1/21/17.
//  Copyright © 2017 Oliver Mulcahy. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    //fields
    
    @IBOutlet var wageTicker: WKInterfaceLabel!
    
    //variables
    var seconds: Double = 0
    var totalWage: Double = 0
    var timer = Timer()
    
    // functions
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(InterfaceController.action), userInfo: nil, repeats: true)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func action()
    {
        totalSeconds += 1
        wageTicker.text = "$"String(format: "%.2f", totalWage)
    }

}
