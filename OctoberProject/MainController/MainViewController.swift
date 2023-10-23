//
//  MainViewController.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 09.10.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UITabBarControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    
    private let backColor = UIColor(red: 250/255, green: 250/255, blue: 252/255, alpha: 1)
    var label = UILabel()
    var personPhoto: UIImageView!
    var petPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self
        view.backgroundColor = backColor
        initialize()
        
    }
    
    
    // MARK: - UICollectionViewDataSource
    
    private let items: [PostItem] = [
        PostItem(type: .MainTopCell),
        PostItem(type: .MainPetInfoCell)
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        switch item.type {
        case .MainTopCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainTopCell", for: indexPath) as! MainTopCell
            cell.configure()
            cell.delegate = self
            return cell
        case .MainPetInfoCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainPetInfoCell", for: indexPath) as! MainPetInfoCell
            cell.configure()
            return cell
        }
        
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height: CGFloat = width
        return CGSize(width: width, height: height)
        
    }
    
    func initialize() {
        //MARK: - настройка collectionView
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MainTopCell.self, forCellWithReuseIdentifier: "MainTopCell")
        collectionView.register(MainPetInfoCell.self, forCellWithReuseIdentifier: "MainPetInfoCell")
        collectionView.backgroundColor = backColor
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(93)
        }
    }
}

extension MainViewController: MainTopCellDelegate {
    func didTapPersonInfoViewButton() {
        print("didTapPersonInfoViewButton pressed in VC")
    }
}
