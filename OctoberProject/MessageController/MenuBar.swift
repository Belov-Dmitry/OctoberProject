//
//  MenuBar.swift
//  OctoberProject
//
//  Created by Mishana on 11.10.2023.
//

import UIKit
import SnapKit

final class MenuBar: UIView {
    
    private let cells: [CollectionCell] = [CollectionCell(title: "Поблизости", image: nil), CollectionCell(title: "Избранное", image: "star.fill")]
    
    private let cellId = "CellID"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    let borderBottom = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(collectionView)
        addSubview(borderBottom)
        
        configureAppearance()
        selectedIndex()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MenuBar {
    
    func selectedIndex() {
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .top)
    }
    
    func configureAppearance() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        borderBottom.backgroundColor = UIColor.lightGray
        
        collectionView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).inset(20)
            make.trailing.equalTo(self.snp.trailing).inset(20)
            make.centerY.equalTo(self.snp.centerY)
            make.bottom.equalTo(self.snp.bottom)
            make.top.equalTo(self.snp.top)
            make.width.equalTo(self.snp.width).offset(-40)
        }
        borderBottom.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(1)
        }
    }
}

extension MenuBar: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSizeMake(self.frame.width / 2.25, frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.setTitleImage(cells[indexPath.item], index: indexPath.item)
        cell.tintColor = .lightGray
        cell.tag = indexPath.item
        return cell
    }
    
    
}
