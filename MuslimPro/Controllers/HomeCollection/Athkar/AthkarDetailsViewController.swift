//
//  AthkarDetailsViewController.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/16/21.
//

import UIKit

class AthkarDetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var segmentedButtonView: SegmentedButtonsView = {
        let segmentedButtons = SegmentedButtonsView()
        segmentedButtons.setLabelsTitles(titles: ["Morning", "Evening"])
        segmentedButtons.backgroundColor = #colorLiteral(red: 0.3609279692, green: 0.7386778593, blue: 0.50698632, alpha: 1)
        return segmentedButtons
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    weak var delegate: CollectionViewDidScrollDelegate?
    
    let athkar = ["Morning", "Evening"]

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(segmentedButtonView)
        view.addSubview(collectionView)
        segmentedButtonView.segmentedControlDelegate = self
        configureCollectionView()
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        segmentedButtonView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                   leading: view.leadingAnchor,
                                   bottom: collectionView.topAnchor,
                                   trailing: view.trailingAnchor,
                                   padding: .init(top: 0,
                                                  left: 0,
                                                  bottom: 0,
                                                  right: 0),
                                   size: .init(width: view.width,
                                               height: 60))
        
        collectionView.anchor(top: segmentedButtonView.bottomAnchor,
                              leading: view.leadingAnchor,
                              bottom: view.bottomAnchor,
                              trailing: view.trailingAnchor)
    }
    
    // MARK: - Helper Functions
    
    private func configureCollectionView() {
        collectionView.register(AthkarContainerCollectionViewCell.self, forCellWithReuseIdentifier: AthkarContainerCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - CollectionView Delegate and DataSource

extension AthkarDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return athkar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AthkarContainerCollectionViewCell.identifier, for: indexPath) as? AthkarContainerCollectionViewCell else {
            fatalError("Could not load \(AthkarContainerCollectionViewCell.self)")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.width,
                      height: collectionView.height - 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate = segmentedButtonView
        delegate?.collectionViewDidScroll(for: scrollView.contentOffset.x / 2)
    }
    
    func scrollToFrame(scrollOffset: CGFloat) {
        guard scrollOffset <= collectionView.contentSize.width - collectionView.bounds.size.width else {
            return }
        guard scrollOffset >= 0 else { return }
        collectionView.setContentOffset(CGPoint(x: scrollOffset, y: collectionView.contentOffset.y), animated: true)
    }
}

// MARK: - SegmentedControlDelegate

extension AthkarDetailsViewController: SegmentedControlDelegate {
    
    func didIndexChanged(at index: Int) {
        
        let collectionBounds = collectionView.bounds
        
        if index == 0 {
            // scroll forward
            let contentOffset = CGFloat(floor(collectionView.contentOffset.x - collectionBounds.size.width))
            moveToFrame(contentOffset: contentOffset)
        } else if index == 1 {
            let contentOffset = CGFloat(floor(collectionView.contentOffset.x + collectionBounds.size.width))
            moveToFrame(contentOffset: contentOffset)
        }
    }
    
    func moveToFrame(contentOffset: CGFloat) {
        let frame: CGRect = CGRect(x: contentOffset,
                                   y: collectionView.contentOffset.y,
                                   width: collectionView.width,
                                   height: collectionView.height)
        collectionView.scrollRectToVisible(frame, animated: true)
    }
}
