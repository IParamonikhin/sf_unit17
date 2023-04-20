//
//  ViewController.swift
//  sf_unit17
//
//  Created by Иван on 18.04.2023.
//

import UIKit

extension Float {
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
    
    var screenValue : Float = 0.0
    var plus : Bool = false
    var minus : Bool = false
    var division : Bool = false
    var multiplication : Bool = false
    var degree : Bool = false
    var equal : Bool = false
    
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
        if !screen.contains("."){
            screen += "."
        }
        labelView.text = screen
    }
    
    @IBAction func buttonEqual(_ sender: UIButton) {
        var screen : String = labelView.text!
        if plus{
            let secondValue : Float = Float(screen)!
            screenValue += secondValue
            screen = screenValue.truncatingRemainder(dividingBy: 1) == 0 ? screenValue.cleanValue : String(screenValue)
            labelResult.text = ""
            labelView.text = screen
        }
        buttonColorReset()
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
    
    @IBAction func buttonPlus(_ sender: UIButton) {
        var screen : String = labelView.text!
        if !plus {
            screenValue = Float(screen)!
            plus = true
            buttonPlus.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1)
        }
        else{
            let secondValue : Float = Float(screen)!
            screenValue += secondValue
            screen = screenValue.truncatingRemainder(dividingBy: 1) == 0 ? screenValue.cleanValue : String(screenValue)
        }
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
        if !minus {
            screenValue = Float(screen)!
            minus = true
            buttonMinus.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1)
        }
        else{
            let secondValue : Float = Float(screen)!
            screenValue -= secondValue
            screen = screenValue.truncatingRemainder(dividingBy: 1) == 0 ? screenValue.cleanValue : String(screenValue)
        }
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
        if !multiplication {
            screenValue = Float(screen)!
            multiplication = true
            buttonMultiplication.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1)
        }
        else{
            let secondValue : Float = Float(screen)!
            screenValue *= secondValue
            screen = screenValue.truncatingRemainder(dividingBy: 1) == 0 ? screenValue.cleanValue : String(screenValue)
        }
        labelResult.text = screen
        screen = "0"
        labelView.text = screen
    }
    
    @IBAction func buttonC(_ sender: UIButton) {
        labelView.text = "0"
        labelResult.text = ""
        screenValue = Float(labelView.text!)!
        buttonColorReset()
    }
    
    @IBAction func buttonSign(_ sender: UIButton) {
        var screen : String = labelView.text!
        if screen != "0" && !screen.contains("-") {
            screen.insert("-", at: screen.startIndex)
        }
        labelView.text = screen
    }
    
    @IBAction func buttonPercent(_ sender: UIButton) {
    }
    
    @IBAction func buttonDivision(_ sender: UIButton) {
        var screen : String = labelView.text!
        if screen != "0"
        {
            if !division {
                screenValue = Float(screen)!
                plus = true
                buttonDivision.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1)
            }
            else{
                let secondValue : Float = Float(screen)!
                screenValue /= secondValue
                screen = screenValue.truncatingRemainder(dividingBy: 1) == 0 ? screenValue.cleanValue : String(screenValue)
            }
            labelResult.text = screen
            screen = "0"
            labelView.text = screen
        }
        else{
            labelView.text = "Error!"
        }
    }
    
    @IBAction func buttonRoot(_ sender: UIButton) {
    }
    
    @IBAction func buttonDegree(_ sender: UIButton) {
    }
    
    @IBAction func buttonFraction(_ sender: UIButton) {
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
        if equal{
            screen = "0"
            equal = false
        }
        else{
            screen = labelView.text!
        }
        if num == "0"{
            if screen != num{
                screen += num
            }
        }
        else{
            if screen == "0"{
                screen = num
            }
            else{
                screen += num
            }
        }
        labelView.text = screen
    }
    
    func buttonColorReset () {
        plus = false
        minus = false
        multiplication = false
        division = false
        degree = false
        buttonPlus.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
        buttonMinus.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
        buttonMultiplication.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
        buttonDivision.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
        buttonDegree.backgroundColor = UIColor(red: 0.8021417856, green: 0.3212764561, blue: 0.1372393668, alpha: 1)
    }
    
}


