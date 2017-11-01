//
//  CardView.swift
//  fiveCardsTechnicalTask
//
//  Created by Gleb Kalachev on 11/1/17.
//  Copyright © 2017 Gleb Kalachev. All rights reserved.
//

import UIKit

class CardView: RoundedView {
   
   
   //Outlets
   @IBOutlet var titleLabel: UILabel!
   @IBOutlet var theTextField: UITextField!
   
   //Properties
   let minAvailableValue = 1
   //will set max in the ViewController
   var maxAvailableValue: Int!
   
   var nValue: Int!
   
   
   override func awakeFromNib() {
      
   }
   
   @IBAction func confirmAndRequestButtonTapped(sender: UIButton) {
   
   }
   
   
   
   
   
}
