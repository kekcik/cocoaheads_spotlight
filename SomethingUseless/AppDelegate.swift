//
//  AppDelegate.swift
//  SomethingUseless
//
//  Created by Иван Трофимов on 21.05.2020.
//  Copyright © 2020 Иван Трофимов. All rights reserved.
//

import UIKit
import CoreSpotlight

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
        // Словарь, содержащий необходимые данные для восстановления состояния
        print("userActivity.userInfo", userActivity.userInfo ?? [:])
        
        // Тип активити, например, CoreSpotlight или свой созданный тип
        print("userActivity.activityType", userActivity.activityType)
        
        // Далее мы открываем экран согласно полученным данным
        
        return true
    }

}

