//
//  HomeCollectionViewCell.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/15/21.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    
    static let identifier = String(describing: HomeCollectionViewCell.self)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        return image
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemFill
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 14
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize = contentView.height - 40
        imageView.frame = CGRect(x: (contentView.width - imageSize) / 2,
                                 y: 3,
                                 width: imageSize,
                                 height: imageSize)
        titleLabel.centerXInSuperview()
        titleLabel.anchor(top: imageView.bottomAnchor,
                          leading: nil,
                          bottom: contentView.bottomAnchor,
                          trailing: nil,
                          padding: .init(top: 10, left: 0, bottom: 10, right: 0))
    }
    
    // MARK: - Helper Functions
    
    func configure(with name: String) {
        titleLabel.text = name
        imageView.image = UIImage(named: name)
    }
}
