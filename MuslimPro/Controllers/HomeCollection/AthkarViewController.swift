//
//  AthkarViewController.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/11/21.
//

import UIKit

class AthkarViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Athkar"
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
 
    // MARK: - Helper Functions
    
    
    
    // MARK: - Selectors

}

// MARK: - UICollectionView Delegates and DataSourec

