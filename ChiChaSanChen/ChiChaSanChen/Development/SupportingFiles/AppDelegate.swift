//
//  AppDelegate.swift
//  ChiChaSanChen
//
//  Created by Umair Yousaf on 20/12/2023.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Override point for customization after application launch.
//        APIConfig.shared.environment = .DEV
//        APIConfig.shared.setEnvironmentVariable()
//        GMSServices.provideAPIKey("AIzaSyAZhAb6fmrfkVYHj-IobponaV8zq0sisBY")
        self.enableIQKeyBoard()
//        AppConfigurations.shared.showAppLaunch()
        return true
    }
    
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//            let configuration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
//            if connectingSceneSession.role == .windowApplication {
//                configuration.delegateClass = SceneDelegate.self
//            }
//            return configuration
//        }

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

    func enableIQKeyBoard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true

    }

}

