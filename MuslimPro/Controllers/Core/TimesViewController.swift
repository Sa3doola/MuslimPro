//
//  TimesViewController.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/11/21.
//

import UIKit

class TimesViewController: UIViewController {
    
    // MARK: - Properties
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let tableView: UITableView = {
        let tabel = UITableView()
        tabel.allowsSelection = false
        tabel.isScrollEnabled = false
        return tabel
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(headerView)
        configureTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let headrHeight = (view.height / 3) - 100
        headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          leading: view.leadingAnchor,
                          bottom: tableView.topAnchor,
                          trailing: view.trailingAnchor,
                          padding: .init(top: 0, left: 0, bottom: 20, right: 0),
                          size: .init(width: view.width,
                                      height: headrHeight))
        tableView.anchor(top: headerView.bottomAnchor,
                         leading: view.leadingAnchor,
                         bottom: nil,
                         trailing: view.trailingAnchor,
                         padding: .init(top: 20, left: 0, bottom: 0, right: 0),
                         size: .init(width: view.width,
                                     height: (view.height - headrHeight) - 100))
    }
    
    // MARK: - Helper Functions
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.register(TimesTableViewCell.self, forCellReuseIdentifier: TimesTableViewCell.identifier)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableView Delegate and DataSource

extension TimesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TimesTableViewCell.identifier, for: indexPath) as? TimesTableViewCell else {
            fatalError("Could not load tableCell \(TimesTableViewCell.self)")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
