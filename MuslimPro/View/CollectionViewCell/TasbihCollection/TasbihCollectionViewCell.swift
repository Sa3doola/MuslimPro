//
//  TasbihCollectionViewCell.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/26/21.
//

import UIKit

class TasbihCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: TasbihCollectionViewCell.self)
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        contentView.addSubview(textLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.centerInSuperview(size: .init(width: 100, height: 50))
    }
    
    func configure(with string: String) {
        textLabel.text = string
    }
    
}
