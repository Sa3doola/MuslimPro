//
//  OnboardingViewController.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/11/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    
    static let identifier = String(describing: OnboardingViewController.self)
    
    private let storageManager = StorageManager.shared
    private let navigationManager = NaigationManager.shared
    
    var slides: [OnboardingViewModel] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            switch currentPage {
            case 0:
                configButton.setTitle("Locate Me", for: .normal)
            case 1:
                configButton.setTitle("Next", for: .normal)
            default:
                configButton.setTitle("Get Started", for: .normal)
            }
        }
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var configButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureCollectionView()
        configureViewModel()
        updateFlag()
    }
    
    
    // MARK: - Helper Functions
    
    private func configureViewModel() {
        slides = [
            OnboardingViewModel(title: "Prayer Times",
                                subTitle: "Update Prayer Time depending on your location, Please allow to get Location.",
                                image: #imageLiteral(resourceName: "Onboarding1")),
            OnboardingViewModel(title: "Quran kareem",
                                subTitle: "You Can Read Quran when offline in Arabic and tsabih counter and muslim athkar morning and evening.",
                                image: #imageLiteral(resourceName: "Onboarding2")),
            OnboardingViewModel(title: "Qibla Direction",
                                subTitle: "You Can Find the Correct Direction of The Qibla is the direction Towards the Kaaba in the Sacred Mosque in Mecca in your Location.",
                                image: #imageLiteral(resourceName: "Onboarding3"))
        ]
    }
    
    private func configureCollectionView() {
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        configButton.constrainWidth(constant: view.width / 2)
        configButton.layer.cornerRadius = 16
    }
    
    private func updateFlag() {
        storageManager.setOnboardingSeen()
    }
    
    private func goToNextPage() {
        currentPage += 1
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    // MARK: - Selectors
    
    @IBAction func configButtonTapped(_ sender: UIButton) {
        switch currentPage {
        case 0:
            goToNextPage()
        case 1:
            goToNextPage()
        case 2:
            navigationManager.show(screen: .baseTabBar, inController: self)
        default:
            goToNextPage()
        }
    }
}

// MARK: - CollectionView DelegateFlowLayout and Data Source

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else {
            fatalError("Could not Load \(OnboardingCollectionViewCell.self)")
        }
        cell.configure(viewModel: slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.width,
                      height: collectionView.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}
