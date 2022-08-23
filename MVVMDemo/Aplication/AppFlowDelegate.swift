//
//  AppFlowDelegate.swift
//  MVVMDemo
//
//  Created by javad Arji on 8/18/22.
//

import UIKit

enum AppFlow {
    case main
    
    var viewController: UIViewController {
        switch self {
        case .main:
            return MainViewController()
        }
    }
}

protocol AppFlowDelegate {
    func changeFlow(to flow: AppFlow)
}

extension AppFlowDelegate where Self: AppDelegate {
    private var transition: CATransition {
        let transition = CATransition()
        transition.type = .reveal
        transition.duration = 0.5
        
        return transition
    }
    
    func changeFlow(to flow: AppFlow) {
        ///Warning:  ommiting this line of code causes `memoryLeak`
        window?.rootViewController = nil
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.layer.add(transition, forKey: kCATransition)
        window!.rootViewController = flow.viewController
        window!.makeKeyAndVisible()
    }
}

extension AppDelegate: AppFlowDelegate {}
