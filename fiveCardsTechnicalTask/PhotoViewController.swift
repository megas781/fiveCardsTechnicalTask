//
//  PhotoViewController.swift
//  fiveCardsTechnicalTask
//
//  Created by Gleb Kalachev on 11/1/17.
//  Copyright © 2017 Gleb Kalachev. All rights reserved.
//

import UIKit
import SwiftyJSON
class PhotoViewController: UIViewController {
   
   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var theImageView: UIImageView!
   
   
   
   override func viewWillAppear(_ animated: Bool) {
      
      self.titleLabel.text = "[...loading...]"
      
      let session = URLSession.shared.dataTask(with: URL.init(string: "https://jsonplaceholder.typicode.com/photos/3")!) { (data, response, error) in
         
         if let error = error {
            print("error: \(error.localizedDescription)")
         }
         
         guard let data = data else {
            print("coundn't retrieve data")
            return
         }
         
         let json = JSON.init(data: data)
         
         DispatchQueue.main.async {
            self.titleLabel.text = json["title"].string
         }
         
         let imageURL = URL.init(string: json["url"].string!)!
         
         print("imageURL: \(imageURL)")
         
         let imageSession = URLSession.shared.dataTask(with: imageURL, completionHandler: { (data, response, error) in
            
            if let error = error {
               print("error: \(error.localizedDescription)")
            }
            
            guard let data = data, let theImage = UIImage.init(data: data) else {
               print("coundn't retrieve image data")
               return
            }
            
            DispatchQueue.main.async {
               self.theImageView.image = theImage
            }
            
         })
         
         imageSession.resume()
         
      }
      
      session.resume()
   }
   
   
}
