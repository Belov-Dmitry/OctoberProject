//
//  MenuCell.swift
//  OctoberProject
//
//  Created by Mishana on 11.10.2023.
//

import UIKit
import SnapKit

final class MenuCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let title: UILabel = {
       let title = UILabel()
        title.text = "Поблизости"
        title.font = UIFont.systemFont(ofSize: 18)
        return title
    }()
    
    private let horizontalBar = UIView()
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                imageView.tintColor = self.tag == 0 ? UIColor.black : UIColor.orange
                title.textColor = self.tag == 0 ? UIColor.lightGray : UIColor.orange
            }else if !isHighlighted {
                imageView.tintColor = .lightGray
                title.textColor = .lightGray
            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                imageView.tintColor = self.tag == 0 ? UIColor.black : UIColor.orange
                title.textColor = self.tag == 0 ? UIColor.black : UIColor.orange
            }else if !isSelected {
                title.textColor = self.tag == 0 ? UIColor.black : UIColor.lightGray
                imageView.tintColor = .lightGray
            }
            horizontalBar.isHidden = isSelected ? false : true
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(horizontalBar)
        addSubview(imageView)
        addSubview(title)
        
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setTitleImage(_ cell: CollectionCell, index: Int) {
        
        if let cellImage = cell.image {
            imageView.image =  UIImage(systemName: "\(cellImage)")?.withRenderingMode(.alwaysTemplate)
        }
        horizontalBar.backgroundColor = index == 0 ? .systemBlue : .orange
        
        horizontalBar.isHidden = isSelected ? false : true
        title.text = cell.title
        if index == 0{
            title.textColor = isSelected ? .black : .black
        }else if index == 1 {
            title.textColor = isSelected ? .orange : .lightGray
        }
        
    }
}

private extension MenuCell {

    
    func configureAppearance() {
        backgroundColor = .white
        
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
}
