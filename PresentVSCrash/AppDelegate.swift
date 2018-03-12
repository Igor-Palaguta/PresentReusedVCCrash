//
//  AppDelegate.swift
//  PresentVSCrash
//
//  Created by Igor Palaguta on 12.03.18.
//  Copyright © 2018 Igor Palaguta. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let rootViewController = UIViewController()
        rootViewController.view.backgroundColor = .red
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        let reusedModalViewController = UIViewController()
        reusedModalViewController.view.backgroundColor = .green
        
        rootViewController.present(reusedModalViewController, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let newRootViewController = UIViewController()
            rootViewController.view.backgroundColor = .yellow
            self.window?.rootViewController = newRootViewController
            
            print(reusedModalViewController.isBeingPresented)
            
            //Uncomment to see fix
//            if reusedModalViewController.presentingViewController != nil {
//                reusedModalViewController.dismiss(animated: false) {
//                    newRootViewController.present(reusedModalViewController, animated: true, completion: nil)
//                }
//            }
            
            newRootViewController.present(reusedModalViewController, animated: true, completion: nil)
        }
        
        return true
    }
}

