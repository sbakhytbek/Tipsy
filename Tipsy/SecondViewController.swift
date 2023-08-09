//
//  SecondViewController.swift
//  Tipsy
//
//  Created by Zhenis Takhmina on 08.11.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var amountLabel : UILabel?
    @IBOutlet weak var textLabel : UILabel?
    
    var textFromVC : String = ""
    var secTextFromVC : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountLabel?.text = textFromVC
        textLabel?.text = secTextFromVC
        textLabel?.numberOfLines = 0
        textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
    }
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
    
}
