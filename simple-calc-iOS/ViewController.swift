//
//  ViewController.swift
//  simple-calc-iOS
//
//  Created by iGuest on 10/24/17.
//  Copyright © 2017 Jingyu Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currOp : String = ""
    var inputNums : String = ""
    @IBOutlet weak var displayText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func add(_ first : Double, _ second : Double) -> Double {
        return first + second
    }

    func subtract(_ first : Double, _ second : Double) -> Double {
        return first - second
    }

    func multiply(_ first : Double, _ second : Double) -> Double {
        return first * second
    }

    func divide(_ first : Double, _ second : Double) -> Double {
        return first / second
    }
    
    func mod(_ first : Double, _ second : Double) -> Double {
        return (first.truncatingRemainder(dividingBy: second))
    }
    
    func genericNumOperation(_ op : String, _ num1 : String, _ num2 : String) -> Double {
        let n1 : Double = Double(num1)!
        let n2 : Double = Double(num2)!
        switch(op) {
        case "+":
            return add(n1, n2)
        case "-":
            return subtract(n1, n2)
        case "*":
            return multiply(n1, n2)
        case "/":
            return divide(n1, n2)
        case "%":
            return mod(n1, n2)
        default:
            return 0.0
        }
    }
    func fact(_ num : Int) -> Int{
        var result = 1;
        if num != 0 {
            for i in 1...(num) {
                result *= i
            }
        }
        return result
    }
    
    func avg(_ nums : [String]) -> Double{
        var sum : Double = 0.0
        for num in nums {
            sum += Double(num)!
        }
        return sum / Double(nums.count)
    }
    func clear() {
        inputNums = ""
        currOp = ""
        // clear text
        // disable operand buttons?
    }
    

    @IBAction func onClickFunction(_ sender: UIButton) {
        var text : String = ""
        let buttonPressed : String! = sender.titleLabel!.text
        switch buttonPressed {
        case "=" :
            var nums : [String] = inputNums.components(separatedBy: " ")
            switch currOp {
            case "COUNT":
                text += String(nums.count)
            case "+", "-", "*", "/", "%":
                text += String(genericNumOperation(currOp, nums[0], nums[1]))
            case "AVG":
                text += String(avg(nums))
            case "FACT":
                text += String(fact(Int(nums[0])!))
            default:
                text = "not valid"
            }
            clear()
        case "+", "-", "*", "/", "%", "COUNT", "AVG", "FACT" :
            inputNums += " "
            currOp = buttonPressed
            text += currOp
        default:
            inputNums += buttonPressed
            text += buttonPressed
        }
        displayText.text = text
    }
}

