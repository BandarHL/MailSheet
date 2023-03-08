//
//  MailSheetViewController.swift
//  Created by Bandar Alruwaili
//

import UIKit

public class MailSheetViewController: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<MailSheetSection, MailSheetItem>?
    private var sections = [MailSheetSection]()
    private var navigationConfig: MailSheetNavigationConfig?
    
    private lazy var collectionView: UICollectionView = { [weak self] in
        guard let self = self else {return UICollectionView()}
        let collection = UICollectionView(frame: self.view.frame, collectionViewLayout: createCompositionalLayout())
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(MailSheetBoxCollectionViewCell.self, forCellWithReuseIdentifier: MailSheetBoxCollectionViewCell.reuseIdentifier)
        collection.register(MailSheetLongCollectionViewCell.self, forCellWithReuseIdentifier: MailSheetLongCollectionViewCell.reuseIdentifier)
        collection.backgroundColor = .sheetViewController
        return collection
    }()
    
    public init(navigationConfig: MailSheetNavigationConfig, sections: [MailSheetSection]) {
        self.navigationConfig = navigationConfig
        self.sections = sections
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func show(on presenter: UIViewController, animated: Bool = true) {
        let navigation = UINavigationController(rootViewController: self)
        navigation.modalPresentationStyle = .pageSheet
        if let sheet = navigation.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        presenter.present(navigation, animated: animated)
    }
}

extension MailSheetViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .sheetViewController
        
        setupNavigationView()
        setupCollectionView()
        createDataSource()
        
        self.applySnapshot(with: self.sections)
    }
    
    private func setupNavigationView() {
        if let navigationConfig {
            let navigationView = MailSheetNavigationView()
            navigationView.configure(with: navigationConfig)
            self.navigationItem.titleView = navigationView
        }
    }
    
    private func setupCollectionView() {
        self.view.addSubview(self.collectionView)
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}

extension MailSheetViewController {
    private func configure<T: MailSheetConfiguringCell>(cellType: T.Type, with item: MailSheetItem, for indexPath: IndexPath) -> T where T : UICollectionViewCell & MailSheetConfiguringCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else { fatalError("Unable to load this cell") }
        cell.configure(with: item)
        return cell
    }
    
    private func createDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource<MailSheetSection, MailSheetItem>(collectionView: self.collectionView, cellProvider: { [weak self] (collectionView, indexPath, anime) -> UICollectionViewCell? in
            switch self?.sections[indexPath.section].type {
            case .boxCell:
                return self?.configure(cellType: MailSheetBoxCollectionViewCell.self, with: anime, for: indexPath)
            case .longCell:
                return self?.configure(cellType: MailSheetLongCollectionViewCell.self, with: anime, for: indexPath)
            default:
                return self?.configure(cellType: MailSheetLongCollectionViewCell.self, with: anime, for: indexPath)
            }
        })
    }
    
    private func applySnapshot(with sections: [MailSheetSection]) {
        var snapshot = NSDiffableDataSourceSnapshot<MailSheetSection, MailSheetItem>()
        snapshot.appendSections(sections)
        
        for section in sections {
            if !(section.items.isEmpty) {
                snapshot.appendItems(section.items, toSection: section)
            }
        }
        self.dataSource?.apply(snapshot)
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            [weak self] sectionIndex, layoutEnv in
            if let section = self?.sections[sectionIndex] {
                if !(section.items.isEmpty) {
                    switch section.type {
                    case .boxCell:
                        return MailSheetBoxCollectionViewCell.layoutSection()
                    case .longCell:
                        return MailSheetLongCollectionViewCell.layoutSection()
                    }
                }
            }
            return nil
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.contentInsetsReference = .layoutMargins
        config.interSectionSpacing = 8
        layout.configuration = config
        return layout
    }
}

extension MailSheetViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = self.sections[indexPath.section].items[indexPath.item]
        item.action(item)
    }
}
