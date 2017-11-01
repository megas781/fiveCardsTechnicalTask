//
//  ViewController.swift
//  fiveCardsTechnicalTask
//
//  Created by Gleb Kalachev on 11/1/17.
//  Copyright © 2017 Gleb Kalachev. All rights reserved.
//

import UIKit
import SwiftyJSON
class MainViewController: UIViewController {

   
   @IBOutlet weak var postNValueTextField: UITextField!
   @IBOutlet weak var commentNValueTextField: UITextField!
   
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      
      
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
      switch segue.identifier! {
      case "fromMainToPostViewControllerSegueIdentifier":
         break
      case "fromMainToCommentViewControllerSegueIdentifier":
         break
      case "fromMainToUsersViewControllerSegueIdentifier":
         break 
      case "fromMainToPhotoViewControllerSegueIdentifier":
         break 
      case "fromMainToRandomTodoViewControllerSegueIdentifier":
         break
      default:
         fatalError("Что-то намудрил с segue identifier'ами")
      }
      
      
   }
   

}

