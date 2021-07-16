//
//  AthkarContainerCollectionViewCell.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/15/21.
//

import UIKit

class AthkarContainerCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = String(describing: AthkarContainerCollectionViewCell.self)
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

