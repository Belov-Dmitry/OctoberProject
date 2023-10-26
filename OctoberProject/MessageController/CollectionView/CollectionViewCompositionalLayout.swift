//
//  CollectionViewCompositionalLayout.swift
//  OctoberProject
//
//  Created by Mishana on 25.10.2023.
//

import UIKit
import SnapKit


final class CollectionViewCompositionalLayout: UIView {
    enum Section {
        case navigation
        case border
        case message
        case selectedMessage
        
        var numberOfItems: Int {
            switch self {
            case .navigation:
                return 1
            case .border:
                return 1
            case .message:
                return 3
            case .selectedMessage:
                return 5
            }
        }
    }
    
    private var viewModel: [Section] = [
        .navigation,
        .border,
        .message,
            .selectedMessage
    ]
    
    private lazy var layout: UICollectionViewLayout = {
        UICollectionViewCompositionalLayout { (section, environment) -> NSCollectionLayoutSection? in
            let sectionType = self.viewModel[section]
            
            switch sectionType {
            case .navigation:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(87)),
                    subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 1
                section.contentInsets = .init(top: 0,
                                              leading: 20,
                                              bottom: 0,
                                              trailing: 20)
                return section
            case .border:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(1)),
                    subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 1
                section.contentInsets = .init(top: 0,
                                              leading: 0,
                                              bottom: 20,
                                              trailing: 0)
                return section
            case .message:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(65)),
                    subitems: [item])
                group.edgeSpacing = NSCollectionLayoutEdgeSpacing(
                    leading: nil,
                    top: nil,
                    trailing: nil,
                    bottom: .flexible(15))
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 1
                section.contentInsets = .init(top: 0,
                                              leading: 20,
                                              bottom: 0,
                                              trailing: 17)
                return section
            case .selectedMessage:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)))
                
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(65)),
                    subitems: [item])
                group.edgeSpacing = NSCollectionLayoutEdgeSpacing(
                    leading: nil,
                    top: nil,
                    trailing: nil,
                    bottom: .flexible(15))
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 1
                section.contentInsets = .init(top: 0,
                                              leading: 20,
                                              bottom: 0,
                                              trailing: 17)
                return section
            }
        }
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: self.layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(ButtonsNavigationCell.self,
                                forCellWithReuseIdentifier: ButtonsNavigationCell.cellID)
        collectionView.register(BorderCell.self,
                                forCellWithReuseIdentifier: BorderCell.cellID)
        collectionView.register(MessageCell.self,
                                forCellWithReuseIdentifier: MessageCell.cellIDNear)
        collectionView.register(MessageCell.self,
                                forCellWithReuseIdentifier: MessageCell.cellIDSelected)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionViewCompositionalLayout: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sectionType = self.viewModel[indexPath.section]
        
        switch sectionType {
        case .navigation:
            if  indexPath.section == 0  && indexPath.item == 0{
                
            } else if indexPath.section == 0  && indexPath.item == 1{
                print(1)
            }
        case .border:
            break
        case .message:
            break
        case .selectedMessage:
            print(4342322)
        }
    }
}

extension CollectionViewCompositionalLayout: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.viewModel.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = self.viewModel[indexPath.section]
        
        switch sectionType {
        case .navigation:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ButtonsNavigationCell.cellID,
                for: indexPath) as? ButtonsNavigationCell
            else {
                return UICollectionViewCell()
            }
            cell.backgroundColor = .clear
            cell.tintColor = Resources.Colors.gray
            cell.tag = indexPath.item
            cell.delegate = self
            
            return cell
        case .border:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BorderCell.cellID,
                for: indexPath) as? BorderCell
            else {
                return UICollectionViewCell()
            }
            return cell
        case .message:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MessageCell.cellIDNear,
                for: indexPath) as? MessageCell
            else {
                return UICollectionViewCell()
            }
            return cell
        case .selectedMessage:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MessageCell.cellIDSelected,
                for: indexPath) as? MessageCell
            else {
                return UICollectionViewCell()
            }
            cell.backgroundColor = .brown
            return cell
        }
    }
}

private extension CollectionViewCompositionalLayout {
    func configureApperance() {
        addSubview(collectionView)
        reloadData(remove: .selectedMessage, insert: .message)
        collectionView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
}

extension CollectionViewCompositionalLayout: NavigationCellDelegate {
    func leftButton(completion: @escaping () -> Void) {
        reloadData(remove: .selectedMessage, insert: .message)
    }
    
    func rightButton(completion: @escaping () -> Void) {
        reloadData(remove: .message, insert: .selectedMessage)
    }
    
    func reloadData(remove: Section, insert: Section) {
        if let messageSectionSelected = self.viewModel.firstIndex(of: remove){
            if let message = self.viewModel.firstIndex(of: insert) {
                self.viewModel.remove(at: messageSectionSelected)
            }else {
                self.viewModel.remove(at: messageSectionSelected)
                self.viewModel.insert(insert, at: 2)
            }
        }
        self.collectionView.reloadData()
    }
}
