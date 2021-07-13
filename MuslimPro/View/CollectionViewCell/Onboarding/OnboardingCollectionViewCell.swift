//
//  OnboardingCollectionViewCell.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/13/21.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = String(describing: OnboardingViewController.self)
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.centerXInSuperview()
        let imageHeight = contentView.width - 30
        imageView.anchor(top: contentView.topAnchor,
                         leading: nil,
                         bottom: stackView.topAnchor,
                         trailing: nil,
                         padding: .init(top: 20, left: 0, bottom: 0, right: 0),
                         size: .init(width: contentView.width - 30,
                                     height: contentView.width - 30))
        
        let stackViewHeight = contentView.height - imageHeight - 20
        stackView.anchor(top: imageView.bottomAnchor,
                         leading: contentView.leadingAnchor,
                         bottom: contentView.bottomAnchor,
                         trailing: contentView.trailingAnchor,
                         padding: .init(top: 0, left: 10, bottom: 0, right: 10),
                         size: .init(width: contentView.width - 20,
                                     height: stackViewHeight))
    }
    
    // MARK: - Helper Functions
    
    func configure(viewModel: OnboardingViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subTitle
        imageView.image = viewModel.image
    }
}
