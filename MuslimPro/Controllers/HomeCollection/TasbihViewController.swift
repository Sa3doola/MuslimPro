//
//  TasbihViewController.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/11/21.
//

import UIKit

class TasbihViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: - Life Cycle
    // MARK: - Helper Functions
    // MARK: - Selectors

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tasbih"
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

}
