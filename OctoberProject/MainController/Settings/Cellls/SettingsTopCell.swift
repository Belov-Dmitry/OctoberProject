//
//  SettingsTopCell.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 19.11.2023.
//

import UIKit

class SettingsTopCell: UITableViewCell {

    // MARK: - Private constants
    private enum UIConstants {
        static let collectionViewHeight: CGFloat = 152
        static let cellWidth: CGFloat = 88
        static let cellHeight: CGFloat = 107
    }
    // MARK: - Private properties
    private var collectionView: UICollectionView!
    private var items: SettingsTopCellItemsType = []
    //MARK: - Private properties
    
    // MARK: - Public
    func configure(with info: SettingsTopCellItemsType) {
        self.items = info
        collectionView.reloadData()
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
private extension SettingsTopCell {
    func initialize() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //горизонтальный скрол
        layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20) //отступы ячейки коллекции
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       
        collectionView.register(SettingsCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: SettingsCollectionViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false //индикатор скрола
        
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(UIConstants.collectionViewHeight)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension SettingsTopCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SettingsCollectionViewCell.self), for: indexPath) as! SettingsCollectionViewCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SettingsTopCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cellWidth, height: UIConstants.cellHeight)
    }
}
