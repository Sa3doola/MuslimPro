//
//  Manager.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/11/21.
//

import Foundation
import UIKit
import CoreLocation

// MARK: - ServicesManager

class ServicesManager {
    /**
     Singleton pattern
        SingleObject Class a static instance of itself.
     */
    static let shared = ServicesManager()
    
    func handleDataTimetoString(dataTime: [DataTime]) -> [String] {
        
        var array: [String] = []
        
        let currentDate = Date()
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "dd-MM-yyyy"
        
        let today = dateFormmater.string(from: currentDate)
        
        for choosen in dataTime {
            if choosen.date.gregorian.date == today {
                let timingModel = choosen.timings
                
                let imsakString = String().editString(input: timingModel.Imsak)
                let imsakTime = DateFormatter().editTime(string: imsakString)
                array.append(imsakTime)
                
                let fajrString = String().editString(input: timingModel.Fajr)
                let fajrTime = DateFormatter().editTime(string: fajrString)
                array.append(fajrTime)
                
                let sunriseString = String().editString(input: timingModel.Sunrise)
                let sunriseTime = DateFormatter().editTime(string: sunriseString)
                array.append(sunriseTime)
                
                let duhurString = String().editString(input: timingModel.Dhuhr)
                let duhurTime = DateFormatter().editTime(string: duhurString)
                array.append(duhurTime)
                
                let asrString = String().editString(input: timingModel.Asr)
                let asrTime = DateFormatter().editTime(string: asrString)
                array.append(asrTime)
                
                let maghribString = String().editString(input: timingModel.Maghrib)
                let maghribTime = DateFormatter().editTime(string: maghribString)
                array.append(maghribTime)
                
                let ishaString = String().editString(input: timingModel.Isha)
                let ishaTime = DateFormatter().editTime(string: ishaString)
                array.append(ishaTime)
            }
        }
        return array
    }
}


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


