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
        mainWindow.backgroundColor = .appBackground
        UINavigationBar.appearance().barTintColor = .appBackground
        let navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController.view.backgroundColor = .appBackground
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.shadowImage = UIImage()
        mainWindow.rootViewController = navigationController

        window = mainWindow
        window?.makeKeyAndVisible()

        return true
    }

}

