//
//  MailSheetLongCollectionViewCell.swift
//  Created by Bandar Alruwaili
//

import UIKit

class MailSheetLongCollectionViewCell: UICollectionViewCell, MailSheetConfiguringCell {
    static var reuseIdentifier: String = "MailSheetLongCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .systemFont(ofSize: 18)
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
        self.addSubview(titleLabel)
        self.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: 25),
            self.imageView.heightAnchor.constraint(equalToConstant: 25),
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
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(55))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])

        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.interGroupSpacing = 10
        layoutSection.contentInsets = .init(top: 0, leading: 7.5, bottom: 0, trailing: 7.5)
        return layoutSection
    }
}
