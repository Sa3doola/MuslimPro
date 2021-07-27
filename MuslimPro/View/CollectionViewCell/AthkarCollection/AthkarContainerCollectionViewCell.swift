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
    
    let athkarMorning = Bundle.main.decode([AthkarModel].self, from: "Morning.json")
    let athkarEvening = Bundle.main.decode([AthkarModel].self, from: "Evening.json")
    
    var athkarConfirm: String?
    
    lazy var collectionView: UICollectionView = {
        var collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        collectionLayout.estimatedItemSize = CGSize(width: contentView.width, height: 500)
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

// MARK: - CollectionView Delegate and DataSource

extension AthkarContainerCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if athkarConfirm == "Morning" {
            return athkarMorning.count
        }else {
            return athkarEvening.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AthkarDetailsCollectionViewCell.identifier, for: indexPath) as? AthkarDetailsCollectionViewCell else {
            fatalError("Could not load \(AthkarDetailsCollectionViewCell.self)")
        }
        
        if let athkarType = athkarConfirm {
            
            if athkarType == "Morning" {
                let athkars = athkarMorning[indexPath.row]
                let zekr = athkars.zekr
                let desc = athkars.description
                cell.config(withViewModel: AthkarViewModel(count: 3, description: desc, zekr: zekr))
            } else {
                let athkarsEv = athkarEvening[indexPath.row]
                let zekr = athkarsEv.zekr
                let desc = athkarsEv.description
                cell.config(withViewModel: AthkarViewModel(count: 3, description: desc, zekr: zekr))
            }
        }
        return cell
    }
}
