//
//  ViewController.swift
//  fiveCardsTechnicalTask
//
//  Created by Gleb Kalachev on 11/1/17.
//  Copyright © 2017 Gleb Kalachev. All rights reserved.
//

/*
 Ремарки:
    - Сделал так, при нажатии на кнопки первых двух карточек, в случае если textField.text пустой или равен nil, то число N генерируется рандомно. В правом нижнем углу (Post/Comment)ViewController'a будет отображаться, рандомное значение или нет.
 */

import UIKit
import SwiftyJSON
class MainViewController: UIViewController {

   
   @IBOutlet weak var postNValueTextField: UITextField!
   @IBOutlet weak var commentNValueTextField: UITextField!
   
   @IBOutlet var primeViewsCollection: [UIView]!
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      //Добавляю "фоновым" view gestureRecognizer, чтобы при нажатии на них убиралась клавиатура
      for view in self.primeViewsCollection {
         let gr = UITapGestureRecognizer.init(target: self, action: #selector(self.resignAnyFirstResponder))
         view.addGestureRecognizer(gr)
      }
    
      
      
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      super.prepare(for: segue, sender: sender)
      
      switch segue.identifier! {
      case "fromMainToPostViewControllerSegueIdentifier":
         
         let dvc = segue.destination as! PostViewController
         
         dvc.nValue = ((self.postNValueTextField.text != "") && (self.postNValueTextField.text != nil)) ? Int(self.postNValueTextField.text!)! : (1 + Int(arc4random_uniform(100)))
         dvc.isRandom = !((self.postNValueTextField.text != "") && (self.postNValueTextField.text != nil))
         
      case "fromMainToCommentViewControllerSegueIdentifier":
         
         let dvc = segue.destination as! CommentViewController
         dvc.nValue = ((self.commentNValueTextField.text != "") && (self.commentNValueTextField.text != nil)) ? Int(self.commentNValueTextField.text!)! : (1 + Int(arc4random_uniform(499)))
         
         dvc.isRandom = !((self.postNValueTextField.text != "") && (self.postNValueTextField.text != nil))
         
         
         
         //Это всё вроде как ненужные кейсы
//      case "fromMainToUsersViewControllerSegueIdentifier":
         //print("fromMainToUsersViewControllerSegueIdentifier")
         
         
//      case "fromMainToPhotoViewControllerSegueIdentifier":
         //print("fromMainToPhotoViewControllerSegueIdentifier")
         
         
//      case "fromMainToRandomTodoViewControllerSegueIdentifier":
         //print("fromMainToRandomTodoViewControllerSegueIdentifier")
         
         
      default:
         break
      }
      
      
   }
   
   //Метод, прячащий клавиатуру
   @objc func resignAnyFirstResponder() {
      self.postNValueTextField.resignFirstResponder()
      self.commentNValueTextField.resignFirstResponder()
   }
   

}

