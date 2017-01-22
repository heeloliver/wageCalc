//
//  ViewController.swift
//  wageCalc
//
//  Created by Oliver Mulcahy on 1/21/17.
//  Copyright © 2017 Oliver Mulcahy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    //fields
    
    @IBOutlet weak var wageField: UITextField!
    @IBOutlet weak var timerField: UILabel!
    @IBOutlet weak var wageTimer: UILabel!
    
    
    // variables
    var hours: Double = 0
    var minutes: Double = 0
    var seconds: Double = 0
    var totalSeconds: Double = 0
    var fractions: Double = 0
    var timerString: String = ""
    var wage: Double = 0
    var totalWage: Double = 0
    var timer = Timer()
    
    
    // override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        wageField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func dismissKeyboard()
    {
        wageField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        wageField.resignFirstResponder()
        return true
    }
    // action functions
    @IBAction func startButton(_ sender: Any)
    {
        if (!timer.isValid)
        {
            wage = Double(wageField.text!)!
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        }
    }

    @IBAction func pauseButton(_ sender: Any)
    {
        timer.invalidate()
    }
   
    @IBAction func resetButton(_ sender: Any)
    {
        timer.invalidate()
        fractions = 0
        seconds = 0
        totalSeconds = 0
        minutes = 0
        hours = 0
        timerField.text = "00:00:00:00"
        wageTimer.text = "$0.00"
    }
    
    func action()
    {
        fractions += 1
        if fractions == 60
        {
            seconds += 1
            totalSeconds += 1
            fractions = 0
        }
        if seconds == 60
        {
            minutes += 1
            seconds = 0
        }
        if minutes == 60
        {
            hours += 1
            minutes = 0
        }
        
        let fractionsString = fractions > 9 ? "\(Int(fractions))" : "0\(Int(fractions))"
        let secondsString = seconds > 9 ? "\(Int(seconds))" : "0\(Int(seconds))"
        let minutesString = minutes > 9 ? "\(Int(minutes))" : "0\(Int(minutes))"
        let hoursString = hours > 9 ? "\(Int(hours))" : "0\(Int(hours))"
        
        timerString = "\(hoursString):\(minutesString):\(secondsString):\(fractionsString)"
        
        timerField.text = timerString
        totalWage = Double(totalSeconds*(wage/3600))
        wageTimer.text = "$"+String(format: "%.2f", totalWage)
    }
}

