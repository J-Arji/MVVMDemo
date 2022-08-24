//
//  AppDelegate.swift
//  MVVMDemo
//
//  Created by javad Arji on 8/18/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        changeFlow(to: .note)
        return true
    }
}

