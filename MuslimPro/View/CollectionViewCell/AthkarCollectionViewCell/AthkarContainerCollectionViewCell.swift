//
//  AthkarContainerCollectionViewCell.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/15/21.
//

import UIKit

class AthkarContainerCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let zekr = [
        
        "أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ\nاللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ.\n[آية الكرسى - البقرة 255].",
        
                 "أَصْـبَحْنا وَأَصْـبَحَ المُـلْكُ لله وَالحَمدُ لله ، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير ، رَبِّ أسْـأَلُـكَ خَـيرَ ما في هـذا اليوم وَخَـيرَ ما بَعْـدَه ، وَأَعـوذُ بِكَ مِنْ شَـرِّ ما في هـذا اليوم وَشَرِّ ما بَعْـدَه، رَبِّ أَعـوذُبِكَ مِنَ الْكَسَـلِ وَسـوءِ الْكِـبَر ، رَبِّ أَعـوذُ بِكَ مِنْ عَـذابٍ في النّـارِ وَعَـذابٍ في القَـبْر.",
        
                 "اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ ، خَلَقْتَنـي وَأَنا عَبْـدُك ، وَأَنا عَلـى عَهْـدِكَ وَوَعْـدِكَ ما اسْتَـطَعْـت ، أَعـوذُبِكَ مِنْ شَـرِّ ما صَنَـعْت ، أَبـوءُ لَـكَ بِنِعْـمَتِـكَ عَلَـيَّ وَأَبـوءُ بِذَنْـبي فَاغْفـِرْ لي فَإِنَّـهُ لا يَغْـفِرُ الذُّنـوبَ إِلاّ أَنْتَ .",
        
        "رَضيـتُ بِاللهِ رَبَّـاً وَبِالإسْلامِ ديـناً وَبِمُحَـمَّدٍ صلى الله عليه وسلم نَبِيّـاً.",
        
        "اللّهُـمَّ ما أَصْبَـَحَ بي مِـنْ نِعْـمَةٍ أَو بِأَحَـدٍ مِـنْ خَلْـقِك ، فَمِـنْكَ وَحْـدَكَ لا شريكَ لَـك ، فَلَـكَ الْحَمْـدُ وَلَـكَ الشُّكْـر."]
    
    let des: [String] = [
        "من قالها حين يصبح أجير من الجن حتى يمسى ومن قالها حين يمسى أجير من الجن حتى يصبح.",
        "من قالها موقنا بها حين يمسى ومات من ليلته دخل الجنة وكذلك حين يصبح.",
        "من قالها حين يصبح وحين يمسى كان حقا على الله أن يرضيه يوم القيامة.",
        "من قالها أعتقه الله من النار.",
        "من قالها حين يصبح أدى شكر يومه."
    ]
    
    static let identifier = String(describing: AthkarContainerCollectionViewCell.self)
    
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


extension AthkarContainerCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AthkarDetailsCollectionViewCell.identifier, for: indexPath) as? AthkarDetailsCollectionViewCell else {
            fatalError("Could not load \(AthkarDetailsCollectionViewCell.self)")
        }
        let athkar = zekr[indexPath.row]
        let dess = des[indexPath.row]
        cell.config(with: athkar, desc: dess)
        return cell
    }
}
