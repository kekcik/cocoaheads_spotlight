//
//  NSUserActivityVC.swift
//  SomethingUseless
//
//  Created by Иван Трофимов on 25.05.2020.
//  Copyright © 2020 Иван Трофимов. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class NSUserActivityVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    
    
    
        
    private func addUserActivity(for user: User) {
        let userActivity = NSUserActivity(activityType: "   ")
                
        userActivity.userInfo = ["id": user.id]

        userActivity.isEligibleForSearch = true
//        userActivity.isEligibleForHandoff = true
//        userActivity.isEligibleForPrediction = true
        userActivity.isEligibleForPublicIndexing = true

//        userActivity.title = "Search Tutorial"
//        userActivity.keywords = []
        
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeData as String)
        attributeSet.title = "* \(user.name)"
        attributeSet.keywords = user.name.split(separator: " ").map({ String($0) })
        attributeSet.keywords?.append(user.group)
        attributeSet.phoneNumbers = [user.phone]
        attributeSet.contentDescription = user.group

        userActivity.contentAttributeSet = attributeSet
        
        self.userActivity = userActivity
        self.userActivity?.becomeCurrent()
    }
    
    
    
    
    
    
    
    
}

extension NSUserActivityVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.testUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user = DataManager.testUsers[indexPath.row]
        cell.textLabel?.text = user.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let user = DataManager.testUsers[indexPath.row]
        addUserActivity(for: user)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
