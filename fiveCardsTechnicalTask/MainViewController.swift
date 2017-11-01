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
   
   @IBOutlet var primeViewsCollection: [UIView]!
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      for view in self.primeViewsCollection {
         let gr = UITapGestureRecognizer.init(target: self, action: #selector(self.resignAnyFirstResponder))
         view.addGestureRecognizer(gr)
      }
    
      
      
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
      switch segue.identifier! {
      case "fromMainToPostViewControllerSegueIdentifier":
         print("fromMainToPostViewControllerSegueIdentifier")
         
         let dvc = segue.destination as! PostViewController
         print("self.postNValueTextField.text: \(self.postNValueTextField.text)")
//         print("Int(self.postNValueTextField.text!)!")
         dvc.nValue = ((self.postNValueTextField.text != "") && (self.postNValueTextField.text != nil)) ? Int(self.postNValueTextField.text!)! : (1 + Int(arc4random_uniform(100)))
         
         dvc.isRandom = !((self.postNValueTextField.text != "") && (self.postNValueTextField.text != nil))
         
      case "fromMainToCommentViewControllerSegueIdentifier":
         print("fromMainToCommentViewControllerSegueIdentifier")
         let dvc = segue.destination as! CommentViewController
         dvc.nValue = ((self.commentNValueTextField.text != "") && (self.commentNValueTextField.text != nil)) ? Int(self.commentNValueTextField.text!)! : (1 + Int(arc4random_uniform(499)))
         
         dvc.isRandom = !((self.postNValueTextField.text != "") && (self.postNValueTextField.text != nil))
         
         
         
      case "fromMainToUsersViewControllerSegueIdentifier":
         print("fromMainToUsersViewControllerSegueIdentifier")
         
         
      case "fromMainToPhotoViewControllerSegueIdentifier":
         print("fromMainToPhotoViewControllerSegueIdentifier")
         
         
      case "fromMainToRandomTodoViewControllerSegueIdentifier":
         print("fromMainToRandomTodoViewControllerSegueIdentifier")
         
         
      default:
         fatalError("Что-то намудрил с segue identifier'ами")
      }
      
      
   }
   
   @objc func resignAnyFirstResponder() {
      self.postNValueTextField.resignFirstResponder()
      self.commentNValueTextField.resignFirstResponder()
   }
   

}

