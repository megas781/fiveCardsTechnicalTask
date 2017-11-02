//
//  UserTableViewCell.swift
//  fiveCardsTechnicalTask
//
//  Created by Gleb Kalachev on 11/1/17.
//  Copyright © 2017 Gleb Kalachev. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
   
   @IBOutlet weak var nameLabel: UILabel!
   @IBOutlet weak var phoneLabel: UILabel!
   @IBOutlet weak var emailLabel: UILabel!
   
   
   //Функция для установки значений outlet'ов. Применяется в cellForRowAtIndexPath
   func setup(withUser user: User) {
      self.nameLabel.text = user.name
      self.emailLabel.text = user.email
      self.phoneLabel.text = user.phone
   }
   
}
