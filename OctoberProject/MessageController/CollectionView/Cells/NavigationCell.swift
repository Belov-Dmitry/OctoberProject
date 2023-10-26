//
//  MenuCell.swift
//  OctoberProject
//
//  Created by Mishana on 16.10.2023.
//

import UIKit
import SnapKit




final class NavigationCell: UICollectionViewCell {
    
    static let cellID = "NavigationCell"
    

    
    private let imageView = UIImageView()
//    private let tap: UIButton = {
//        let button = UIButton()
////        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
//        return button
//    }()
    
    private let title: UILabel = {
       let title = UILabel()
        title.text = "Hello"
        title.font = UIFont.systemFont(ofSize: 18)
        return title
    }()
    
    private let horizontalBar = UIView()
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                imageView.tintColor = self.tag == 0 ? Resources.Colors.dark : Resources.Colors.orange
                title.textColor = self.tag == 0 ? Resources.Colors.gray : Resources.Colors.orange
            }else if !isHighlighted {
                imageView.tintColor = Resources.Colors.lightGray
                title.textColor = Resources.Colors.lightGray
            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
//                tap.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapButton)))
                horizontalBar.backgroundColor = tag == 0 ? Resources.Colors.lightBlue : Resources.Colors.orange
                horizontalBar.isHidden = false
                imageView.tintColor = self.tag == 0 ? Resources.Colors.dark : Resources.Colors.orange
                title.textColor = self.tag == 0 ? Resources.Colors.dark : Resources.Colors.orange
            }else if !isSelected {
                horizontalBar.isHidden = true
                title.textColor = self.tag == 0 ? Resources.Colors.dark : Resources.Colors.gray
                imageView.tintColor = Resources.Colors.lightGray
            }
            horizontalBar.isHidden = isSelected ? false : true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
//        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapButton)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setTitleImage(_ cell: CollectionNavigationCell, index: Int) {
        
        if let cellImage = cell.image {
            imageView.image =  UIImage(named: "\(cellImage)")?.withRenderingMode(.alwaysTemplate)
        }
        
        
        horizontalBar.isHidden = isSelected ? false : true
        title.text = cell.title
        if index == 0{
            title.textColor = isSelected ? Resources.Colors.dark : Resources.Colors.dark
        }else if index == 1 {
            title.textColor = isSelected ? Resources.Colors.orange : Resources.Colors.gray
        }
    }
    
    @objc func tapButton() {
        
        print(1)
    }
}

private extension NavigationCell {
    func configureAppearance() {
//        addSubview(tap)
        addSubview(horizontalBar)
        addSubview(imageView)
        addSubview(title)
        imageView.image = Resources.Images.MessageCollectionCell.starFill
        
//        tap.snp.makeConstraints { make in
//            make.leading.trailing.bottom.top.equalToSuperview()
//        }
        
        horizontalBar.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom).inset(22)
            make.height.equalTo(2)
            make.width.equalTo(self.snp.width)
        }
        title.snp.makeConstraints { make in
            make.center.equalTo(self.snp.center)
            make.leading.equalTo(imageView.snp.trailing).inset(-2)
        }
        imageView.snp.makeConstraints { make in
            make.height.equalTo(15)
            make.width.equalTo(15)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
    
    
//    @objc func tapButton() {
//         i = isSelected
//    }
}
