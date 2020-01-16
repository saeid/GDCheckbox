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
        
        let checkbox: GDCheckbox = GDCheckbox()
        
        /// Checkmark color
        //        checkbox.checkColor = UIColor.red
        
        /// Checkmark line width
        //        checkbox.checkWidth = 3.0
        
        /// Container border line color
        //        checkbox.containerColor = UIColor.blue
        
        /// Container border line width
        //        checkbox.containerWidth = 5.0
        
        /// Make checkbox container circular
        //        checkbox.isCircular = true
        
        /// Turn initial checkbox state to on
        //        checkbox.isOn = false
        
        /// Radio button mode
        //        checkbox.isRadiobox = false
        
        /// Square/Circular mode
        //        checkbox.isSquare = false
        
        /// Animate the checkbox check mark
        //        checkbox.shouldAnimate = false
        
        /// Fill container when it's checked
        //        checkbox.shouldFillContainer = false
        
        /// Container background
//        checkbox.baseColor == UIColor.green
        
        /// Animation duration -- default is 0.2 seconds
//        checkbox.animationDuration = 1
        
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

