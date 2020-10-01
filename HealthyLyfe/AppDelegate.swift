//
//  AppDelegate.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 9/30/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let homeViewController = HomeViewController()
        let mainWindow = UIWindow(frame: UIScreen.main.bounds)
        mainWindow.backgroundColor = UIColor.white
        mainWindow.rootViewController = UINavigationController(rootViewController: homeViewController)

        window = mainWindow
        window?.makeKeyAndVisible()

        return true
    }

}

