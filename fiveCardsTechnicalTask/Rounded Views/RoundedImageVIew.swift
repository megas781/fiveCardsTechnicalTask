//
//  RoundedImageVIew.swift
//  fiveCardsTechnicalTask
//
//  Created by Gleb Kalachev on 11/1/17.
//  Copyright © 2017 Gleb Kalachev. All rights reserved.
//

import UIKit

@IBDesignable class RoundedImageView: UIImageView {
   
   
   
   
   @IBInspectable var theCornerRadius: CGFloat {
      get {
         return self.layer.cornerRadius
      }
      set {
         self.layer.cornerRadius = newValue
      }
   }
   override func awakeFromNib() {
      self.clipsToBounds = true
   }
}
