//
//  Manager.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/11/21.
//

import Foundation
import UIKit

// MARK: - NavigationManager

/**
 This Class UIView provides an easy way to Show onBoarding ViewController First time install App
 It's a utility Class with static methods.
 */
class NaigationManager {
    /**
     Singleton pattern
        SingleObject Class a static instance of itself.
     */
    static let shared = NaigationManager()
    
    /**
        enum for two main screen should show
     */
    enum Screen {
        case onboarding
        case baseTabBar
    }
    /**
     This function to set intialViewController to show
     
     - parameter screen: enum of Screen to switch
     - parameter inController: LoadingViewController should will present the correct ViewController
     */
    func show(screen: Screen, inController: UIViewController) {
        var viewController: UIViewController?
        
        switch screen {
        case .onboarding:
            guard let onboardingViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: OnboardingViewController.identifier) as? OnboardingViewController else { return }
            viewController = onboardingViewController
        case .baseTabBar:
            guard let baseTabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: BaseTabBarViewController.identifier) as? BaseTabBarViewController else { return }
            viewController = baseTabBarController
        }
        
        guard let sceneDelegate = inController.view.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window else { return }
        window.rootViewController = viewController
        UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}

// MARK: - Storage Manager

class StorageManager {
    /**
     Singleton pattern
        SingleObject  a static instance of itself.
     */
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    
    enum key: String {
        case onboardingSeen
    }
    /**
     Check if onboarding is seen
     */
    func isOnboardingSeen() -> Bool {
        userDefaults.bool(forKey: key.onboardingSeen.rawValue)
    }
    /**
     Set onboarding is seen
     */
    func setOnboardingSeen() {
        userDefaults.setValue(true, forKey: key.onboardingSeen.rawValue)
    }
    /**
    Reset onboarding to show
     */
    func resetOnboardingSeen() {
        userDefaults.setValue(false, forKey: key.onboardingSeen.rawValue)
    }
}


