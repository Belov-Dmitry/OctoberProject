//
//  ExampleDataSource.swift
//  OctoberProject
//
//  Created by Mishana on 24.10.2023.
//

import UIKit

final class ExampleDataSource: UICollectionViewDiffableDataSource<Resources.CollectionViewSection, Resources.CollectionViewRow> {
    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .navigation(let model):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonsNavigationCell.cellID, for: indexPath) as? ButtonsNavigationCell
                            else {
                                return UICollectionViewCell()
                            }
                cell.backgroundColor = .white
                cell.tintColor = Resources.Colors.gray
                cell.tag = indexPath.item
                return cell
            case .border(_):
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: BorderCell.cellID,
                    for: indexPath) as? BorderCell
                else {
                    return UICollectionViewCell()
                }
                return cell
            case .message(let model):
                guard let title = model.first else {return UICollectionViewCell()}
                let image = UIImage(named: title.image) ?? UIImage()
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: MessageCell.cellIDNear,
                    for: indexPath) as? MessageCell
                else {
                    return UICollectionViewCell()
                }
                
                cell.setTitleImage(
                    image: image,
                    title: title.title,
                    subT: title.subtitle,
                    location: title.location,
                    starSelect: title.selectedStar,
                    onlineStatusB: title.online)
                return cell
            case .selectedMessage(let model):
//                let title = model
//                let image = UIImage(named: title.image) ?? UIImage()
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: MessageCell.cellIDSelected,
                    for: indexPath) as? MessageCell
                else {
                    return UICollectionViewCell()
                }
//                cell.setTitleImage(
//                    image: image,
//                    title: title.title,
//                    subT: title.subtitle,
//                    location: title.location,
//                    starSelect: title.selectedStar,
//                    onlineStatusB: title.online)
                return cell
            }
        }
    }
}
