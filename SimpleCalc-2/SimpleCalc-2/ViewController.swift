//
//  ViewController.swift
//  SimpleCalc-iOS
//
//  Created by Sarah Feldmann on 10/24/17.
//  Copyright © 2017 Sarah Feldmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var historyText: UILabel!
    
    // MARK: Actions

    var action = false
    var num = 0.0
    var operation = ""
    var nums = [Double]()
    var history = [String]()
    var singleOp = ""
    
    // History
    
    @IBAction func clickHistory(_ sender: Any) {
        var output = ""
        for i in 0...history.count-1 {
            output += "\(history[i]),"
        }
        historyText.text = output
    }
    
    
    
    
    // Numbers
    @IBAction func clickZero(_ sender: Any) {
        if result.text == "0" || action {
            result.text = "0"
        } else {
            result.text = result.text! + "0"
        }
    }
    @IBAction func clickOne(_ sender: Any) {
        if result.text == "0" || action  {
            result.text = "1"
        } else {
            result.text = result.text! + "1"
        }
    }
    @IBAction func clickTwo(_ sender: Any) {
        if result.text == "0" || action {
            result.text = "2"
        } else {
            result.text = result.text! + "2"
        }
    }
    @IBAction func clickThree(_ sender: Any) {
        if result.text == "0" || action {
            result.text = "3"
        } else {
            result.text = result.text! + "3"
        }
    }
    @IBAction func clickFour(_ sender: Any) {
        if result.text == "0" || action {
            result.text = "4"
        } else {
            result.text = result.text! + "4"
        }
    }
    @IBAction func clickFive(_ sender: Any) {
        if result.text == "0" || action {
            result.text = "5"
        } else {
            result.text = result.text! + "5"
        }
    }
    @IBAction func clickSix(_ sender: Any) {
        if result.text == "0" || action {
            result.text = "6"
        } else {
            result.text = result.text! + "6"
        }
    }
    @IBAction func clickSeven(_ sender: Any) {
        if result.text == "0" || action {
            result.text = "7"
        } else {
            result.text = result.text! + "7"
        }
    }
    @IBAction func clickEight(_ sender: Any) {
        if result.text == "0" || action {
            result.text = "8"
        } else {
            result.text = result.text! + "8"
        }
    }
    @IBAction func clickNine(_ sender: Any) {
        if result.text == "0" || action {
            result.text = "9"
        } else {
            result.text = result.text! + "9"
        }
    }
    @IBAction func clickPoint(_ sender: Any) {
        result.text! += "."
    }
    
    
    // Clear
    @IBAction func clickClear(_ sender: Any) {
        result.text = "0"
        num = 0
        nums = [Double]()
    }
    
    // Operations
    @IBAction func clickPlus(_ sender: Any) {
        action = true
        num = (result.text! as NSString).doubleValue
        operation = "add"
        result.text = String(num)
        singleOp += "\(result.text) + "
    }
    @IBAction func clickSub(_ sender: Any) {
        action = true
        num = (result.text! as NSString).doubleValue
        operation = "sub"
        result.text = String(num)
        singleOp += "\(result.text) - "

    }
    @IBAction func clickTimes(_ sender: Any) {
        action = true
        num = (result.text! as NSString).doubleValue
        operation = "mult"
        result.text = String(num)
        singleOp += "\(result.text) * "

    }
    @IBAction func clickDiv(_ sender: Any) {
        action = true
        num = (result.text! as NSString).doubleValue
        operation = "div"
        result.text = String(num)
        singleOp += "\(result.text) / "

    }
    @IBAction func clickMod(_ sender: Any) {
        action = true
        num = (result.text! as NSString).doubleValue
        operation = "mod"
        result.text = String(num)
        singleOp += "\(result.text) % "

    }
    @IBAction func clickCount(_ sender: Any) {
        action = true
        nums.append((result.text! as NSString).doubleValue)
        operation = "count"
        result.text = String((result.text! as NSString).doubleValue)
        singleOp += "\(result.text) count "

    }
    
    @IBAction func clickAvg(_ sender: Any) {
        action = true
        nums.append((result.text! as NSString).doubleValue)
        operation = "avg"
        result.text = String((result.text! as NSString).doubleValue)
        singleOp += "\(result.text) avg "

    }
    @IBAction func clickFact(_ sender: Any) {
        action = true
        nums.append((result.text! as NSString).doubleValue)
        operation = "fact"
        result.text = String((result.text! as NSString).doubleValue)
        singleOp += "\(result.text) fact "

    }
    
    // Equals
    @IBAction func clickEquals(_ sender: Any) {
        if action {
            switch operation{
                case "add":
                singleOp += "\(result.text)"
                result.text = String(Double(num) + (result.text! as NSString).doubleValue)
                singleOp += " = \(result.text)"
                action = false
            case "sub":
                singleOp += "\(result.text)"

                result.text = String(Double(num) - (result.text! as NSString).doubleValue)
                action = false
                singleOp += " = \(result.text)"
            case "mult":
                singleOp += "\(result.text)"
                result.text = String(Double(num) * (result.text! as NSString).doubleValue)
                singleOp += " = \(result.text)"
            case "div":
                singleOp += "\(result.text)"
                result.text = String(Double(num) / (result.text! as NSString).doubleValue)
                action = false
                singleOp += " = \(result.text)"
            case "mod":
                singleOp += "\(result.text)"
                result.text = String(Double(num).truncatingRemainder(dividingBy: (result.text! as NSString).doubleValue))
                    action = false
                singleOp += " = \(result.text)"
            case "count":
                singleOp += "\(result.text)"
                if(nums.count == 1){
                    result.text = "1"
                } else {
                    result.text = String(nums.count + 1)
                }
                nums = [Double]()
                action = false
                singleOp += " = \(result.text)"
            case "avg":
                singleOp += "\(result.text)"
                nums.append((result.text! as NSString).doubleValue)
                var total = 0.0
                for i in 0...nums.count-1 {
                    total += nums[i]
                }
                result.text = String(total/Double(nums.count))
                nums = [Double]()
                action = false
                singleOp += " = \(result.text)"
            case "fact":
                singleOp += "\(result.text)"
                if nums.count > 1 || String(nums[0]) != result.text{
                    result.text = "ERROR"
                } else {
                    var total = 1
                    for i in 1...Int(nums[0] ){
                        total *= i
                    }
                    result.text = String(Double(total))
                }
                nums = [Double]()
                action = false
                singleOp += " = \(result.text)"
            default:
                result.text = result.text
            }
        }
        history.append(singleOp)
        singleOp = ""
    }
}

