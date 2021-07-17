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
    
    lazy var collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        collectionConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.fillSuperview()
    }
    
    // MARK: - Helper Functions
    
    private func collectionConfigure() {
        contentView.addSubview(collectionView)
        collectionView.register(AthkarDetailsCollectionViewCell.self, forCellWithReuseIdentifier: AthkarDetailsCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


extension AthkarContainerCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AthkarDetailsCollectionViewCell.identifier, for: indexPath) as? AthkarDetailsCollectionViewCell else {
            fatalError("Could not load \(AthkarDetailsCollectionViewCell.self)")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Make Dynamic height
        return CGSize(width: collectionView.width,
                      height: 200)
    }
}
