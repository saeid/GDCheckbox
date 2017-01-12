//
//  ViewController.swift
//  CheckBox
//
//  Created by Saeidbsn on 1/12/17.
//  Copyright © 2017 Saeidbsn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let checkbox: GDCheckbox = GDCheckbox()
        
        /// check mark color
//        checkbox.checkColor = UIColor.red
        
        /// check mark line width
//        checkbox.checkWidth = 3.0
        
        /// container border line color
//        checkbox.containerColor = UIColor.blue
        
        /// container border line width
//        checkbox.containerWidth = 5.0
        
        /// make checkbox container circular
//        checkbox.isCircular = true
        
        /// turn initial checkbox state to on
//        checkbox.isOn = false
        
        /// convert to radio button - circular shape with circular fill
//        checkbox.isRadiobox = false
        
        /// fill the container with a square
//        checkbox.isSquare = false
        
        /// animate the checkbox check mark
//        checkbox.shouldAnimate = false
        
        /// fill container background color with containerColor
//        checkbox.shouldFillContainer = false
        
//        self.view.addSubview(checkbox)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onCheckBoxPress(_ sender: GDCheckbox) {
        let state = sender.isOn ? "ON" : "OFF"
        let type = sender.isRadiobox ? "RadioBox" : "CheckBox"
        
        if sender.tag == 0{
            self.statusLabel.text = "\(type) 1 \(state)"
        }else if sender.tag == 1{
            self.statusLabel.text = "\(type) 2 \(state)"
        }else if sender.tag == 2{
            self.statusLabel.text = "\(type) 3 \(state)"
        }else{
            self.statusLabel.text = "\(type) 4 \(state)"
        }
        

    }

}

