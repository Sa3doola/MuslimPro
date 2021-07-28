//
//  HomeViewController.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/11/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let homeCollection = ["Athkar", "Tasbih", "Calendar", "Names"]
    
    private let topView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewCompositionalLayout { (_, _) -> NSCollectionLayoutSection? in
            let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                        heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                         leading: 5,
                                                         bottom: 5,
                                                         trailing: 5)
            let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                         heightDimension: .absolute(150))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize,
                                                           subitem: item,
                                                           count: 2)
            group.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                          leading: 5,
                                                          bottom: 0,
                                                          trailing: 5)
            let section  = NSCollectionLayoutSection(group: group)
            return section
        }
        let collectioView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectioView.backgroundColor = .systemBackground
        collectioView.isScrollEnabled = false
        collectioView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        return collectioView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(topView)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let topViewHeight = (view.height / 2.1)
        topView.anchor(top: view.topAnchor,
                       leading: view.leadingAnchor,
                       bottom: collectionView.topAnchor,
                       trailing: view.trailingAnchor,
                       size: .init(width: view.width,
                                   height: topViewHeight))
        collectionView.anchor(top: topView.bottomAnchor,
                              leading: view.leadingAnchor,
                              bottom: view.bottomAnchor,
                              trailing: view.trailingAnchor)
        
    }
    
    // MARK: - Helper Functions
    
 
    // MARK: - Selectors

}

// MARK: - CollectionView Delegate and DataSource

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
            fatalError("Could not load \(HomeCollectionViewCell.self)")
        }
        cell.configure(with: homeCollection[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let viewController  = AthkarDetailsViewController()
            navigationController?.pushViewController(viewController, animated: true)
        case 1:
            let viewController  = TasbihViewController()
            navigationController?.pushViewController(viewController, animated: true)
        case 2:
            let viewController  = CalendarViewController()
            navigationController?.pushViewController(viewController, animated: true)
        case 3:
            let viewController  = NamesViewController()
            navigationController?.pushViewController(viewController, animated: true)
        default:
            break
        }
    }
}
