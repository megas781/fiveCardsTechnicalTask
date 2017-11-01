//
//  RandomTodoViewController.swift
//  fiveCardsTechnicalTask
//
//  Created by Gleb Kalachev on 11/1/17.
//  Copyright © 2017 Gleb Kalachev. All rights reserved.
//

import UIKit
import SwiftyJSON
class RandomTodoViewController: UIViewController {
   
   
   @IBOutlet weak var isCompletedLabel: UILabel!
   @IBOutlet weak var bodyLabel: UILabel!
   
   
   override func viewWillAppear(_ animated: Bool) {
      
      self.isCompletedLabel.text = "[...loading...]"
      self.bodyLabel.text = "[...loading...]"
      
      let url = URL.init(string: "https://jsonplaceholder.typicode.com/todos")!
      
      
      //Как я выяснил, на сервере 200 todo, так что нужен random [1;200]
      let randomIndex = 1 + Int(arc4random_uniform(200))
      
      let session = URLSession.shared.dataTask(with: url.appendingPathComponent("/\(randomIndex)")) { (data, response, error) in
         if let error = error {
            print("error: \(error.localizedDescription)")
         }
         
         guard let data = data else {
            print("coundn't retrieve data")
            return
         }
         
         let json = JSON.init(data: data)
         
         DispatchQueue.main.async {
            
            self.isCompletedLabel.text = json["completed"].bool! ? "[completed]" : "[uncompleted]"
            self.bodyLabel.text = json["title"].string
            
         }
         
      }
      
      session.resume()
      
   }
   
}
