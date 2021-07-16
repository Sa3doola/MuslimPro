//
//  MuslimAthkarCollectionViewCell.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/16/21.
//

import UIKit

class MuslimAthkarCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = String(describing: MuslimAthkarCollectionViewCell.self)
 
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 24)
        label.sizeToFit()
        label.textColor = .white
        return label
    }()
    
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(backgroundImage)
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundImage.fillSuperview()
        titleLabel.frame = CGRect(x: 10,
                                  y: 10,
                                  width: contentView.width ,
                                  height: 25)
    }
    
    func configure(with string: String) {
        backgroundImage.image = UIImage(named: string)
        titleLabel.text = string
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 16
    }
    
}
