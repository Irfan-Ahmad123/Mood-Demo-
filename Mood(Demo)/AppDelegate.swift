//
//  AppDelegate.swift
//  Mood(Demo)
//
//  Created by Rashdan Natiq on 2024-02-28.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
//this is done for practice of git desktop 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        var initialViewController: UIViewController?
//
//        // Perform login request
//        if let token = UserDefaults.standard.string(forKey: "userToken") {
//                print("Token for fetching from app UserDefaults:", token)
//                //performSegue(withIdentifier: "MainViewController", sender: nil)
//                initialViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
//            } else {
//                //performSegue(withIdentifier: "LoginViewController", sender: nil)
//               initialViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
//            }
//
//            UIApplication.shared.windows.first?.rootViewController = initialViewController
//            UIApplication.shared.windows.first?.makeKeyAndVisible()

            return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

