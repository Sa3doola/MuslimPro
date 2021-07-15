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
    // MARK: - Helper Functions
    // MARK: - Selectors

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calendar"
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
