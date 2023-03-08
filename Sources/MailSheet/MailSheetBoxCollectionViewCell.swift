//
//  MailSheetBoxCollectionViewCell.swift
//  Created by Bandar Alruwaili
//

import UIKit

class MailSheetBoxCollectionViewCell: UICollectionViewCell, MailSheetConfiguringCell {
    static var reuseIdentifier: String = "MailSheetBoxCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .label
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10),
            self.imageView.widthAnchor.constraint(equalToConstant: 25),
            self.imageView.heightAnchor.constraint(equalToConstant: 25),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 3),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: MailSheetItem) {
        self.backgroundColor = .sheetCellColor
        self.layer.cornerRadius = 12
        
        self.titleLabel.text = item.title
        self.imageView.image = item.image
    }
    
    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 7.5, bottom: 0, trailing: 7.5)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitem: layoutItem, count: 4)

        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.interGroupSpacing = 10
        return layoutSection
    }
}
