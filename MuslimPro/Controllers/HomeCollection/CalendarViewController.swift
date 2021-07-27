//
//  CalendarViewController.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/11/21.
//

import UIKit

class CalendarViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calendar"
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Helper Functions
    // MARK: - Selectors

    

}
