//
//  AppDelegate.swift
//  NetEaseCloudMusic
//
//  Created by 郭丰锐 on 2021/2/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        if (UserDefaults.standard.value(forKey: "token") == nil) {
            let loginStoryBoard = UIStoryboard.init(name: "Login", bundle: nil)
            let loginVC = loginStoryBoard.instantiateInitialViewController()
            window.rootViewController = loginVC
        } else {
            let tabStoryBoard = UIStoryboard.init(name: "BaseTabBar", bundle: nil)
            let tabVC = tabStoryBoard.instantiateInitialViewController()
            window.rootViewController = tabVC
        }
        window.makeKeyAndVisible()
        self.window = window
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

