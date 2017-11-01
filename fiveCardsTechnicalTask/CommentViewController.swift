//
//  CommentViewController.swift
//  fiveCardsTechnicalTask
//
//  Created by Gleb Kalachev on 11/1/17.
//  Copyright © 2017 Gleb Kalachev. All rights reserved.
//

import UIKit
import SwiftyJSON
class CommentViewController: UIViewController {
   
   @IBOutlet weak var nameLabel: UILabel!
   @IBOutlet weak var emailLabel: UILabel!
   @IBOutlet weak var bodyTextView: UITextView!
   
   var nValue : Int!
   
   
   override func viewWillAppear(_ animated: Bool) {
      
      guard let n = nValue else {
         print("couldn't retrieve nValue in CommentViewCOntroller")
         return
      }
      
      
      print("n: \(n)")
      nameLabel.text = "[...loading...]"
      emailLabel.text = "[...loading...]"
      bodyTextView.text = "[...loading...]"
      
      var url = URL.init(string: "https://jsonplaceholder.typicode.com/comments/")!
      url.appendPathComponent("\(n)")
      
      let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
         if let error = error {
            print("error: \(error.localizedDescription)")
         }
         
         guard let data = data else {
            print("coundn't retrieve data in CommentViewContorller")
            return
         }
         
         let json = JSON.init(data: data)
         
         DispatchQueue.main.async {
            
            self.nameLabel.text = json["name"].string
            self.emailLabel.text = json["email"].string
            self.bodyTextView.text = json["body"].string
            
         }
      }
      
      session.resume()
      
   }
}
