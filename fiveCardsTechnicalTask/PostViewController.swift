//
//  PostViewController.swift
//  fiveCardsTechnicalTask
//
//  Created by Gleb Kalachev on 11/1/17.
//  Copyright © 2017 Gleb Kalachev. All rights reserved.
//

import UIKit
import SwiftyJSON
class PostViewController: UIViewController {
   
   
   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var bodyTextView: UITextView!
   
   @IBOutlet weak var isRandomIndicator: UILabel!
   
   var nValue: Int!
   
   //Свойство, определяющее, сгенерированно число n случайно или нет (случайно, если textField был пустым)
   var isRandom: Bool!
   
   override func viewWillAppear(_ animated: Bool) {
      
      self.isRandomIndicator.isHidden = !self.isRandom
      
      guard let n = nValue else {
         print("Не смогу извлечь nValue в PostViewController'е")
         return
      }
      
      titleLabel.text = "[...loading...]"
      bodyTextView.text = "[...loading...]"
      
      //Собственно, запрос
      
      var url = URL.init(string: "https://jsonplaceholder.typicode.com/posts/")!
      url.appendPathComponent("\(n)")
      
      let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
         if let error = error {
            print("error: \(error.localizedDescription)")
         }
         
         guard let data = data else {
            print("couldn't retrieve data")
            return
         }
         
         let json = JSON.init(data: data)
         
         DispatchQueue.main.async {
            
            self.titleLabel.text = json["title"].string ?? "[couldn't retrieve title]"
            self.bodyTextView.text = json["body"].string ?? "[couldn't retrieve body]"
         }
      }
      
      session.resume()
      
   }
   
}
