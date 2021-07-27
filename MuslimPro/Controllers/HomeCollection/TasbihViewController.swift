//
//  TasbihViewController.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/11/21.
//

import UIKit

class TasbihViewController: UIViewController {
    
    // MARK: - Properties
    
    private var flowLayout: SnappingCollectionViewLayout = {
        let layout = SnappingCollectionViewLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collection
    }()
    
    var arTasbih = [
        "لَا إِلَهَ إِلَّا اللَّهُ"
        ,"سُبْحَانَ اللَّهِ وَبِحَمْدِهِ، سُبْحَانَ اللَّهِ الْعَظِيمِ"
        , "لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ"
        , "الْلَّهُ أَكْبَرُ"
        , "الحَمْـدُ لله"
        , "أسْتَغْفِرُ اللهَ وَأتُوبُ إلَيْهِ"
    ]
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tasbih"
        view.backgroundColor = .systemBackground
        configure()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: view.leadingAnchor,
                              bottom: nil,
                              trailing: view.trailingAnchor,
                              padding: .init(top: 10,
                                             left: 5,
                                             bottom: 0,
                                             right: 5),
                              size: .init(width: view.width - 10,
                                          height: view.width - 10))
    }
    
    // MARK: - Helper Functions
    
    func configure() {
        view.addSubview(collectionView)
        collectionView.register(TasbihCollectionViewCell.self, forCellWithReuseIdentifier: TasbihCollectionViewCell.identifier)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
    
    func snapToCenter() {
        let centerPoint = view.convert(view.center, to: collectionView)
        guard let centerIndexPath = collectionView.indexPathForItem(at: centerPoint) else { return }
        collectionView.scrollToItem(at: centerIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    func tasbihIndexPath(indexPath: IndexPath) -> String {
        return arTasbih[indexPath.row]
    }
    
    func reverseTasbihArray(array: [String], startIndex: Int, endIndex: Int) {
        if startIndex >= endIndex {
            return
        }
        swap(&arTasbih[startIndex], &arTasbih[endIndex])
        reverseTasbihArray(array: arTasbih, startIndex: startIndex + 1,
                           endIndex: endIndex - 1)
    }
    
    // MARK: - Selectors
    
}

// MARK: - UICollectionView Delegate and Data Source

extension TasbihViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TasbihCollectionViewCell.identifier, for: indexPath) as? TasbihCollectionViewCell else {
            fatalError("Could not load \(TasbihCollectionViewCell.self)")
        }
        let text = arTasbih[indexPath.row]
        cell.configure(with: text)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = view.width - 40
        return CGSize(width: cellSize,
                      height: cellSize)
    }
    
}

// MARK: - UIScrollView Delegate

extension TasbihViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        snapToCenter()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            snapToCenter()
        }
    }
}
