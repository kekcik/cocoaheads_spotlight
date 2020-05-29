//
//  CoreSpotlightVC.swift
//  SomethingUseless
//
//  Created by Иван Трофимов on 21.05.2020.
//  Copyright © 2020 Иван Трофимов. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class CoreSpotlightVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        let users = DataManager.testUsers
        addUsersToSpotlight(users: users)
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        CSSearchableIndex.default().deleteAllSearchableItems { (error) in
            print("deleteAll: ", error ?? "без ошибок")
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    private func addUsersToSpotlight(users: [User]) {
        let searchableItems: [CSSearchableItem] = users.map({ (user) in
            let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeData as String)

            attributeSet.title = user.name
            attributeSet.keywords = user.name.split(separator: " ").map({ String($0) })
            attributeSet.keywords?.append(user.group)
            attributeSet.phoneNumbers = [user.phone]
            attributeSet.contentDescription = user.group

            // так же мы можем добавить иконку, другие контакты и другую информацию
            
            let item = CSSearchableItem(uniqueIdentifier: String(user.id), domainIdentifier: nil, attributeSet: attributeSet)

            return item
       })
       
       CSSearchableIndex.default().indexSearchableItems(searchableItems) { (error) in
           print("index: ", error ?? "без ошибок")
       }
    }
    
    
    
    
    
    
    
    
    
    
}

extension CoreSpotlightVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.testUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user = DataManager.testUsers[indexPath.row]
        cell.textLabel?.text = user.name
        return cell
    }
    
}
