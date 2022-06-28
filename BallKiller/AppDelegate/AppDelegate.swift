//
//  AppDelegate.swift
//  BallKiller
//
//  Created by Serega Kushnarev on 27.06.2022.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var orientationLock = UIInterfaceOrientationMask.portrait
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let welcomeViewController = WelcomeViewController()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = welcomeViewController
    window?.overrideUserInterfaceStyle = .light
    window?.backgroundColor = .white
    window?.makeKeyAndVisible()
    
    return true
  }
}

