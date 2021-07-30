//
//  CalendarViewController.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/11/21.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.backgroundColor = .systemBackground
        calendar.scrollDirection = .horizontal
        return calendar
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calendar"
        view.backgroundColor = .systemBackground
        configCalendar()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendar.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                        leading: view.leadingAnchor,
                        bottom: tableView.topAnchor,
                        trailing: view.trailingAnchor,
                        size: .init(width: view.width,
                                    height: 400))
        tableView.anchor(top: calendar.bottomAnchor,
                         leading: view.leadingAnchor,
                         bottom: view.bottomAnchor,
                         trailing: view.trailingAnchor,
                         size: .init(width: view.width,
                                     height: 400))
    }
    
    // MARK: - Helper Functions
    
    private func configCalendar() {
        view.addSubview(calendar)
        calendar.appearance.subtitleTodayColor = .label
        calendar.appearance.subtitleDefaultColor = .label
        calendar.appearance.weekdayTextColor = .systemGreen
        calendar.appearance.todayColor = .systemGreen
        calendar.appearance.headerTitleColor = .label
        calendar.appearance.titleDefaultColor = .label
        calendar.appearance.selectionColor = .systemOrange
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 18, weight: .medium)
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 18, weight: .medium)
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 18, weight: .medium)
        calendar.delegate = self
        calendar.dataSource = self
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.register(CalendarTableViewCell.self, forCellReuseIdentifier: CalendarTableViewCell.identifier)
        tableView.allowsSelection = false
        tableView.backgroundColor = .red
        tableView.delegate = self
        tableView.dataSource = self
    }

}

// MARK: - UITableView Delegate and DataSource

extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CalendarTableViewCell.identifier, for: indexPath) as? CalendarTableViewCell else {
            fatalError("Could not load tableCell \(CalendarTableViewCell.self)")
        }
        return cell
    }
}

// MARK: - FSCalendar Delegate and DataSource

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date().firstDateOfYear()
    }
}
