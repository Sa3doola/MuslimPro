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
        view.backgroundColor = .orange
        return view
    }()
    
    private let counterView: CounterView = {
        let view = CounterView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return view
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        zekrLabel.text = ""
        descriptionLabel.text = ""
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: targetSize.height))
    }
   
    
    // MARK: - Helper Functions
 
    private func configure() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(zekrLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(footerView)
        footerView.addSubview(counterView)
        counterView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(counterAction(_:))))
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
                                padding: .init(top: 5, left: 10, bottom: 15, right: 10))
        footerView.anchor(top: descriptionLabel.bottomAnchor,
                          leading: contentView.leadingAnchor,
                          bottom: contentView.bottomAnchor,
                          trailing: contentView.trailingAnchor,
                          padding: .init(top: 15, left: 0, bottom: 0, right: 0),
                          size: .init(width: contentView.width,
                                      height: 100))
        counterView.centerInSuperview(size: .init(width: 90,
                                                    height: 90))
    }
    
    func config(withViewModel viewModel: AthkarViewModel) {
        zekrLabel.text = viewModel.zekr
        descriptionLabel.text = viewModel.description
    }
    
    // MARK: - Selectors
    
    @objc private func counterAction(_ sender: UITapGestureRecognizer) {
        print("Counter")
    }
    
}
