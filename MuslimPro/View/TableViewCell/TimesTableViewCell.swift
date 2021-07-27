//
//  TimesTableViewCell.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/27/21.
//

import UIKit

class TimesTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    static let identifier = String(describing: TimesTableViewCell.self)
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "12:04 PM"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.backgroundColor = #colorLiteral(red: 0.3609279692, green: 0.7386778593, blue: 0.50698632, alpha: 1)
        return label
    }()
    
    private let prayerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Dhuhr"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        timeLabel.anchor(top: contentView.topAnchor,
                         leading: contentView.leadingAnchor,
                         bottom: contentView.bottomAnchor,
                         trailing: prayerNameLabel.leadingAnchor,
                         padding: .init(top: 0, left: 0, bottom: 0, right: 10),
                         size: .init(width: 120,
                                     height: contentView.height))
        prayerNameLabel.centerYInSuperview()
        prayerNameLabel.anchor(top: nil,
                               leading: timeLabel.trailingAnchor,
                               bottom: nil,
                               trailing: nil,
                               padding: .init(top: 0, left: 10, bottom: 0, right: 0))
    }
    
    // MARK: - Helper Functions
    
    private func configureUI() {
        contentView.addSubview(timeLabel)
        contentView.addSubview(prayerNameLabel)
    }
}
