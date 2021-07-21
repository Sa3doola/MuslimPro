//
//  AthkarDetailsCollectionViewCell.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/15/21.
//

import UIKit

class AthkarDetailsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = String(describing: AthkarDetailsCollectionViewCell.self)
    
    private let zekrLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9798579276, green: 1, blue: 0.4530350239, alpha: 1)
        return view
    }()
    
    private let counterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("0/3", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUILayout()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 200))
    }
   
    
    // MARK: - Helper Functions
 
    private func configure() {
        contentView.addSubview(zekrLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(footerView)
        footerView.addSubview(counterButton)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        counterButton.clipsToBounds = true
        counterButton.layer.cornerRadius = 35
        counterButton.addTarget(self, action: #selector(counterButtonAction(_:)), for: .touchUpInside)
    }
    
    private func configureUILayout() {
        zekrLabel.anchor(top: contentView.topAnchor,
                         leading: contentView.leadingAnchor,
                         bottom: descriptionLabel.topAnchor,
                         trailing: contentView.trailingAnchor,
                         padding: .init(top: 5, left: 10, bottom: 5, right: 10))
        descriptionLabel.anchor(top: zekrLabel.bottomAnchor,
                                leading: contentView.leadingAnchor,
                                bottom: footerView.topAnchor,
                                trailing: contentView.trailingAnchor,
                                padding: .init(top: 5, left: 10, bottom: 5, right: 10))
        footerView.anchor(top: descriptionLabel.bottomAnchor,
                          leading: contentView.leadingAnchor,
                          bottom: contentView.bottomAnchor,
                          trailing: contentView.trailingAnchor,
                          padding: .init(top: 5, left: 0, bottom: 0, right: 0),
                          size: .init(width: contentView.width,
                                      height: 100))
        counterButton.centerInSuperview(size: .init(width: 70,
                                                    height: 70))
    }
    
    func config(with zekr: String, desc: String) {
        zekrLabel.text = zekr
        descriptionLabel.text = desc
    }
    
    // MARK: - Selectors
    
    @objc private func counterButtonAction(_ sender: UIButton) {
        print("Counter")
    }
    
}
