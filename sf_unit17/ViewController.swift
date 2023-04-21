//
//  ViewController.swift
//  sf_unit17
//
//  Created by Иван on 18.04.2023.
//

import UIKit

extension Double {
    var cleanValue: String {
         String(format: "%.0f", self)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonMultiplication: UIButton!
    @IBOutlet weak var buttonDivision: UIButton!
    @IBOutlet weak var buttonDegree: UIButton!
    
    var firstValue : Double = 0.0
    var secondValue : Double = 0.0
    var degreeValue : Double = 0.0
    var resultValue : Double = 0.0
    
    var operation : Bool = false
    var plus : Bool = false
    var minus : Bool = false
    var division : Bool = false
    var multiplication : Bool = false
    var degree : Bool = false
    var equal : Bool = false
    var error : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelView.text = "0"
    }
    
    @IBAction func button0(_ sender: UIButton) {
        buttonNum("0")
    }
    
    @IBAction func buttonDot(_ sender: UIButton) {
        var screen : String = labelView.text!
        screen = equal ? "0" : labelView.text!
        if equal{equal = false}
        if !screen.contains("."){
            screen += "."
        }
        labelView.text = screen
    }
    
    func mathResult (_ screen: String) -> String{
        var sign : String = ""
        if plus{
            sign = "+"
        }
        if minus{
            sign = "-"
        }
        if multiplication{
            sign = "*"
        }
        if division{
            sign = "/"
        }
        if degree{
            sign = "n"
        }
        return math(sign, screen)
    }
    
    @IBAction func buttonEqual(_ sender: UIButton) {
        var screen : String = labelView.text!
        screen = mathResult(screen)
        buttonColorReset("all")
        labelResult.text = ""
        labelView.text = screen
        equal = true
    }
    
    @IBAction func button1(_ sender: UIButton) {
        buttonNum("1")
    }
    
    @IBAction func button2(_ sender: UIButton) {
        buttonNum("2")
    }
    
    @IBAction func button3(_ sender: UIButton) {
        buttonNum("3")
    }
    
    func math (_ sign : String, _ screen: String) -> String{
        secondValue = Double(screen)!
        if labelResult.text != ""{
            firstValue = Double(labelResult.text!)!
        }
        switch sign{
        case "n":
            resultValue = pow(degreeValue, secondValue)
        case "+":
            resultValue = firstValue + secondValue
        case "-":
            resultValue = firstValue - secondValue
        case "*":
            resultValue = firstValue * secondValue
        case "/":
            resultValue = firstValue / secondValue
        case "root":
            resultValue = sqrt(secondValue)
        case "fract":
            resultValue = 1/secondValue
        case "perc":
            if labelResult.text != ""{
                firstValue = Double(labelResult.text!)!
                resultValue = firstValue / 100 * secondValue
            }
            else{
                firstValue = Double(screen)!
                resultValue = firstValue / 100
            }
        default: break
        }
        return resultValue.truncatingRemainder(dividingBy: 1) == 0 ? resultValue.cleanValue : String(resultValue)
    }
    
    @IBAction func buttonPlus(_ sender: UIButton) {
        var screen : String = labelView.text!
        if operation{
            screen = mathResult(screen)
        }
        if !plus {
            firstValue = Double(screen)!
            plus = true
            operation = true
            buttonPlus.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1)
        }
        buttonColorReset("-")
        buttonColorReset("*")
        buttonColorReset("/")
        buttonColorReset("n")
        labelResult.text = screen
        screen = "0"
        labelView.text = screen
    }
    
    @IBAction func button4(_ sender: UIButton) {
        buttonNum("4")
    }
    
    @IBAction func button5(_ sender: UIButton) {
        buttonNum("5")
    }
    
    @IBAction func button6(_ sender: UIButton) {
        buttonNum("6")
    }
    
    @IBAction func buttonMinus(_ sender: UIButton) {
        var screen : String = labelView.text!
        if operation{
            screen = mathResult(screen)
        }
        if !minus {
            firstValue = Double(screen)!
            minus = true
            operation = true
            buttonMinus.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1)
        }
        buttonColorReset("+")
        buttonColorReset("*")
        buttonColorReset("/")
        buttonColorReset("n")
        labelResult.text = screen
        screen = "0"
        labelView.text = screen
    }
    
    @IBAction func button7(_ sender: UIButton) {
        buttonNum("7")
    }
    
    @IBAction func button8(_ sender: UIButton) {
        buttonNum("8")
    }
    
    @IBAction func button9(_ sender: UIButton) {
        buttonNum("9")
    }
    
    @IBAction func buttonMultiplication(_ sender: UIButton) {
        var screen : String = labelView.text!
        if operation{
            screen = mathResult(screen)
        }
        if !multiplication  {
            firstValue = Double(screen)!
            multiplication = true
            operation = true
            buttonMultiplication.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1)
        }
        buttonColorReset("+")
        buttonColorReset("-")
        buttonColorReset("/")
        buttonColorReset("n")
        labelResult.text = screen
        screen = "0"
        labelView.text = screen
    }
    
    @IBAction func buttonC(_ sender: UIButton) {
        labelView.text = "0"
        labelResult.text = ""
        firstValue = 0.0
        secondValue = 0.0
        resultValue = 0.0
        buttonColorReset("all")
    }
    
    @IBAction func buttonSign(_ sender: UIButton) {
        var screen : String = labelView.text!
        if screen != "0" && !screen.contains("-") {
            screen.insert("-", at: screen.startIndex)
        }
        labelView.text = screen
    }
    
    @IBAction func buttonPercent(_ sender: UIButton) {
        var screen : String = labelView.text!
        screen = math("perc", screen)
        labelView.text = screen
        
    }
    
    @IBAction func buttonDivision(_ sender: UIButton) {
        var screen : String = labelView.text!
        if screen != "0"
        {
            if operation{
                screen = mathResult(screen)
            }
            if !division  {
                firstValue = Double(screen)!
                division = true
                operation = true
                buttonDivision.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1)
            }
            labelResult.text = screen
            screen = "0"
            labelView.text = screen
        }
        else{
            labelView.text = "Error!"
            error = true
        }
    }
    
    @IBAction func buttonRoot(_ sender: UIButton) {
        var screen : String = labelView.text!
        screen = math("root", screen)
        labelView.text = screen
        equal = true
    }
    
    @IBAction func buttonDegree(_ sender: UIButton) {
        var screen : String = labelView.text!
        if !degree  {
            degreeValue = Double(screen)!
            degree = true
            operation = true
            buttonDegree.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1)
        }
        else{
            screen = mathResult(screen)
        }
        labelResult.text = screen
        screen = "0"
        labelView.text = screen
    }
    
    @IBAction func buttonFraction(_ sender: UIButton) {
        var screen : String = labelView.text!
        screen = math("fract", screen)
        labelView.text = screen
        equal = true
    }
    
    @IBAction func buttonDel(_ sender: UIButton) {
        var screen : String = labelView.text!
        if screen.count > 1{
            screen.removeLast()
        }
        else{
            screen = "0"
        }
        labelView.text = screen
    }
    
    func buttonNum (_ num : String){
        var screen : String = ""
        screen = equal ? "0" : labelView.text!
        if equal{equal = false}
        
        if num == "0"{
            if screen != num{screen += num}
        }
        else{
            screen = screen == "0" ? num : screen + num
        }
        labelView.text = screen
    }
    
    func buttonColorReset (_ sign: String) {
        switch sign{
        case "+":
            plus = false
            buttonPlus.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
        case "-":
            minus = false
            buttonMinus.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
        case "*":
            multiplication = false
            buttonMultiplication.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
        case "/":
            division = false
            buttonDivision.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
        case "n":
            degree = false
            buttonDegree.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
        default:
            plus = false
            minus = false
            multiplication = false
            division = false
            degree = false
            operation = false
            error = false
            buttonPlus.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
            buttonMinus.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
            buttonMultiplication.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
            buttonDivision.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
            buttonDegree.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
        }
//        plus = false
//        minus = false
//        multiplication = false
//        division = false
//        degree = false
//        buttonPlus.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
//        buttonMinus.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
//        buttonMultiplication.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
//        buttonDivision.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
//        buttonDegree.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
    }
    
}


