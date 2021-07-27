//
//  NamesViewController.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/11/21.
//

import UIKit

class NamesViewController: UITableViewController {
    
    // MARK: - Properties
    
    let names = Bundle.main.decode([NamesModel].self, from: "Names.json")
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Names of Allah"
        view.backgroundColor = .systemBackground
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Helper Functions
    
    private func configure() {
        tableView.register(NamesTableViewCell.self, forCellReuseIdentifier: NamesTableViewCell.identifier)
        tableView.allowsSelection = false
    }
    
    // MARK: - TableView Delegate and DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NamesTableViewCell.identifier, for: indexPath) as? NamesTableViewCell else {
            fatalError("Could not Load \(NamesTableViewCell.self)")
        }
        let index = indexPath.row + 1
        let namesModel = names[indexPath.row]
        let arName = namesModel.arabicName
        let enName = namesModel.englishName
        let translate = namesModel.translate
        
        cell.configure(withViewModel: NamesViewModel(arName: arName, enName: enName, translate: translate), index: index)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
