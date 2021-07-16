//
//  AthkarViewController.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/11/21.
//

import UIKit

class AthkarViewController: UIViewController {
    
    // MARK: - Properties
    
    let cellConfigure = ["Morning and Evening", "Food and Drink", "Travel", "All"]
    
    private let collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.register(MuslimAthkarCollectionViewCell.self, forCellWithReuseIdentifier: MuslimAthkarCollectionViewCell.identifier)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Athkar"
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.fillSuperview()
    }
 
    // MARK: - Helper Functions
    
}

// MARK: -  CollectionView Delegate and DataSource

extension AthkarViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MuslimAthkarCollectionViewCell.identifier, for: indexPath) as? MuslimAthkarCollectionViewCell else {
            fatalError("Could not load \(MuslimAthkarCollectionViewCell.self)")
        }
        cell.configure(with: cellConfigure[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.width - 20,
                      height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let viewController = AthkarDetailsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
