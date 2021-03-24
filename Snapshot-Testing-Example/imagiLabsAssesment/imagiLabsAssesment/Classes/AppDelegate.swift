//
//  AppDelegate.swift
//  imagiLabs Assesment
//
//  Created by Csongor Korosi on 05/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navigationViewController: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tutorialViewController = TutorialViewController(viewModel: TutorialViewModel())
        navigationViewController = UINavigationController(rootViewController: tutorialViewController)
        navigationViewController?.navigationBar.isHidden = true
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window!.rootViewController = navigationViewController
        window!.makeKeyAndVisible()
        
        return true
    }
}

