//
//  ViewController.swift
//  Tipsy
//
//  Created by Bakhytbek Sanzhar on 08.11.2022.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var countLabel: UILabel!
    
    var totalAmount = ""
    var finishCountLabel = ""
    var finishSelectedBtn = ""
    var totalResult = " "
        
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        totalAmount = sender.text ?? ""
    }

    @IBAction func SelectedBtn(_ sender: UIButton) {
        
        sender.backgroundColor = sender.backgroundColor == UIColor.blue ? UIColor.gray : UIColor.blue

        if(sender.tag == 0){
            finishSelectedBtn = "0"
        }else if (sender.tag == 1){
            finishSelectedBtn = "10"
        }else if (sender.tag == 2){
            finishSelectedBtn = "20"
        }else {
            return
        }
    }
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        countLabel.text = Int(sender.value).description
        finishCountLabel = String(sender.value)
        
    }
    
    func Calculate(){
        var result : Double = 0.0
        var persentSum : Double = 0.0
        
        persentSum = (Double(totalAmount)! * Double(finishSelectedBtn)!) / 100
        result = (persentSum + Double(totalAmount)!) / Double(finishCountLabel)!
        totalResult = String(NSString(format: "%.2f", result))
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult"{
        let secondVC = segue.destination as! SecondViewController
            Calculate()
            secondVC.textFromVC =  totalResult
            secondVC.secTextFromVC = "Split between \(finishCountLabel) people with \(finishSelectedBtn)% tip"
        }
    }
   
    @IBAction func showResultDidTap(_ sender: UIButton) {
        performSegue(withIdentifier: "showResult", sender: self)
    
    }
}



