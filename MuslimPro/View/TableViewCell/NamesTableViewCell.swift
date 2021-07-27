//
//  NamesTableViewCell.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/25/21.
//

import UIKit

class NamesTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = String(describing: NamesTableViewCell.self)

    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "NamesBackground")
        return image
    }()
    
    private let arNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private let enNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private let translateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let indexLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 0.7803921569, alpha: 1)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundImage.fillSuperview(padding: .init(top: 5, left: 0, bottom: 0, right: 0))
        arNameLabel.anchor(top: contentView.topAnchor,
                           leading: nil,
                           bottom: contentView.bottomAnchor,
                           trailing: contentView.trailingAnchor,
                           padding: .init(top: 5, left: 5, bottom: 5, right: 40))
        
        indexLabel.anchor(top: contentView.topAnchor,
                          leading: contentView.leadingAnchor,
                          bottom: contentView.bottomAnchor,
                          trailing: enNameLabel.trailingAnchor,
                          padding: .init(top: 0, left: 40, bottom: 0, right: 15))
        enNameLabel.anchor(top: contentView.topAnchor,
                           leading: indexLabel.leadingAnchor,
                           bottom: nil,
                           trailing: nil,
                           padding: .init(top: 20, left: 40, bottom: 0, right: 0))
        translateLabel.anchor(top: nil,
                              leading: indexLabel.leadingAnchor,
                              bottom: contentView.bottomAnchor,
                              trailing: nil,
                              padding: .init(top: 0, left: 40, bottom: 20, right: 0))
    }
    
    // MARK: - Helper Function
    
    private func configureUI() {
        contentView.addSubview(backgroundImage)
        contentView.addSubview(enNameLabel)
        contentView.addSubview(arNameLabel)
        contentView.addSubview(translateLabel)
        contentView.addSubview(indexLabel)
    }
    
    public func configure(withViewModel viewModel: NamesViewModel, index: Int) {
        arNameLabel.text = viewModel.arName
        enNameLabel.text = viewModel.enName
        translateLabel.text = viewModel.translate
        indexLabel.text = "\(index)."
    }
    

}
