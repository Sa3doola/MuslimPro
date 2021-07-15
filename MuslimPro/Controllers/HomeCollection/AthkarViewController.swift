//
//  AthkarViewController.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/11/21.
//

import UIKit

class AthkarViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var segmenteButtonsView: SegmentedButtonsView = {
       let segmentedButtonView = SegmentedButtonsView()
        
        segmentedButtonView.setLabelsTitles(titles: ["Morning", "Evening"])
        segmentedButtonView.backgroundColor = #colorLiteral(red: 0.3609279692, green: 0.7386778593, blue: 0.50698632, alpha: 1)
        
        return segmentedButtonView
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: collectionLayout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    let athkar = ["Morning", "Evening"]
    
    weak var delegate: CollectionViewDidScrollDelegate?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Athkar"
        view.backgroundColor = .systemBackground
        view.addSubview(segmenteButtonsView)
        view.addSubview(collectionView)
        configCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        segmenteButtonsView.anchor(top: view.topAnchor,
                                   leading: view.leadingAnchor,
                                   bottom: collectionView.topAnchor,
                                   trailing: view.trailingAnchor,
                                   padding: .init(top: 90, left: 0, bottom: 0, right: 0),
                                   size: .init(width: view.width,
                                               height: 50))
        
        collectionView.anchor(top: segmenteButtonsView.bottomAnchor,
                              leading: view.leadingAnchor,
                              bottom: view.bottomAnchor,
                              trailing: view.trailingAnchor)
    }
 
    // MARK: - Helper Functions
    
    private func configCollectionView() {
        segmenteButtonsView.segmentedControlDelegate = self
        
        collectionView.register(AthkarContainerCollectionViewCell.self,
                                forCellWithReuseIdentifier: AthkarContainerCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    
    // MARK: - Selectors

}

// MARK: - UICollectionView Delegates and DataSource

extension AthkarViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return athkar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AthkarContainerCollectionViewCell.identifier, for: indexPath) as? AthkarContainerCollectionViewCell else { fatalError("Could not load \(AthkarContainerCollectionViewCell.self)")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.width,
                      height: view.height - 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate = segmenteButtonsView
        delegate?.collectionViewDidScroll(for: scrollView.contentOffset.x / 2)
    }
    
    func scrollToFrame(scrollOffset: CGFloat) {
        guard scrollOffset <= collectionView.contentSize.width - collectionView.bounds.size.width else {
            return }
        guard scrollOffset >= 0 else { return }
        collectionView.setContentOffset(CGPoint(x: scrollOffset, y: collectionView.contentOffset.y), animated: true)
    }
}

// MARK: - SegmentedButtonViewDelegate

extension AthkarViewController: SegmentedControlDelegate {
    
    func didIndexChanged(at index: Int) {
        
        let collectionBounds = self.collectionView.bounds
        
        if index == 0 {
            // scroll forward
            
            let contentOffset = CGFloat(floor(self.collectionView.contentOffset.x - collectionBounds.size.width))
            moveToFrame(contentOffset: contentOffset)
        } else if index == 1 {
            // scroll backward
            let contentOffset = CGFloat(floor(self.collectionView.contentOffset.x + collectionBounds.size.width))
            moveToFrame(contentOffset: contentOffset)
        }
    }
    
    func moveToFrame(contentOffset: CGFloat) {
        
        let frame: CGRect = CGRect(x: contentOffset,
                                   y: collectionView.contentOffset.y,
                                   width: collectionView.width,
                                   height: collectionView.height)
        self.collectionView.scrollRectToVisible(frame, animated: true)
    }
    
    
}
