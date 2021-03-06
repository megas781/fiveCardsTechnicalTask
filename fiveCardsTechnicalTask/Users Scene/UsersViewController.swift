//
//  UsersViewController.swift
//  fiveCardsTechnicalTask
//
//  Created by Gleb Kalachev on 11/1/17.
//  Copyright © 2017 Gleb Kalachev. All rights reserved.
//

import UIKit
import SwiftyJSON

//Структура пользователя. Она используется для метода setup(withUser:) класса UserTableViewCell
struct User {
   var name: String
   var email: String
   var phone: String
}

class UsersViewController: UITableViewController {
   
   //Здесь будут храниться user'ы
   var userCollection: [User] = []
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.title = "First Five Users"
      //Убираем начальные линии
      self.tableView.tableFooterView = UIView.init(frame: CGRect.zero)
      
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      let url = URL.init(string: "https://jsonplaceholder.typicode.com/users/")!
      
      let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
         if let error = error {
            print("error: \(error.localizedDescription)")
         }
         
         guard let data = data else {
            print("coundn't retrieve data")
            return
         }
         
         let json = JSON.init(data: data)
         
         guard let jArray = json.array else {
            print("coundn't cast json to array")
            return
         }
         
         //парсим только первые 5 элементов
         for userJSONIndex in 0...4 {
            
            if let name = jArray[userJSONIndex]["name"].string,
            let email = jArray[userJSONIndex]["email"].string,
               let phone = jArray[userJSONIndex]["phone"].string {
               
               let newUser = User.init(name: name, email: email, phone: phone)
               
               self.userCollection.append(newUser)
               
            }
            
         }
         
         DispatchQueue.main.async {
            //Вместо self.tableView.ReloadData() делаю таким образом для красивой анимации))
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: (0...4).map({ return IndexPath.init(row: $0, section: 0)}), with: .automatic)
            self.tableView.endUpdates()
         }
      }
      
      session.resume()
      
   }
   
   //После ухода с viewController'a обнуляю userColelction (может и напрасно, потому что произойдет deinit и данные исчезнут)
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      self.userCollection = []
   }
   
   
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return userCollection.count
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
      
      cell.setup(withUser: self.userCollection[indexPath.row])
      
      return cell
   }
}
