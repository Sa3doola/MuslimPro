//
//  LoadingViewController.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/11/21.
//

import UIKit

class LoadingViewController: UIViewController {

    // MARK: - Properties
    
    private var isOnboardingSeen: Bool!
    private let navigationManager = NaigationManager.shared
    private let storageManager = StorageManager.shared
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isOnboardingSeen = storageManager.isOnboardingSeen()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showInitialScreen()
    }
    
    // MARK: - Helper Functions
    
    private func showInitialScreen() {
        if isOnboardingSeen {
            navigationManager.show(screen: .baseTabBar, inController: self)
        } else {
            navigationManager.show(screen: .onboarding, inController: self)
        }
    }
}
