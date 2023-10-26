//
//  ButtonsNavigationCell.swift
//  OctoberProject
//
//  Created by Mishana on 25.10.2023.
//

import UIKit
import SnapKit


protocol NavigationCellDelegate: AnyObject {
//    func button(completion: @escaping ()->Void)
//    func button(completion: @escaping (CollectionViewCompositionalLayout.Section.ButtonTag)->Void)
    func leftButton(completion: @escaping ()->Void)
    func rightButton(completion: @escaping ()->Void)
//    func buttons(completion: @escaping (CollectionViewCompositionalLayout.Section.ButtonTag)->Void)
}

final class ButtonsNavigationCell: UICollectionViewCell {

    static let cellID = "NavigationCell"
    
    private let imageView: UIImageView = {
        let image = Resources.Images.MessageCollectionCell.starFill
        let view = UIImageView()
        view.image = image?.withRenderingMode(.alwaysTemplate)
        return view
    }()
    
    weak var delegate: NavigationCellDelegate?
    
    private let titleNear: UILabel = {
       let title = UILabel()
        title.text = "Поблизости"
        title.textColor = Resources.Colors.dark
        title.font = UIFont.systemFont(ofSize: 18)
        return title
    }()
    
    private let titleSelected: UILabel = {
       let title = UILabel()
        title.text = "Выбранные"
        title.textColor = Resources.Colors.gray
        title.font = UIFont.systemFont(ofSize: 18)
        return title
    }()
    
    private let buttonNear: UIButton = {
        let button = UIButton()
        button.tag = 0
        button.addTarget(self, action: #selector(leftButton), for: .touchUpInside)
//        button.addTarget(self, action: #selector(buttons(0)), for: .touchUpInside)
        return button
    }()
    private let buttonSelected: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.addTarget(self, action: #selector(rightButton), for: .touchUpInside)
        return button
    }()
    
    private let leftHorizontalBar = UIView()
    private let rightHorizontalBar = UIView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private extension ButtonsNavigationCell {
    func configureAppearance() {
        addSubview(buttonNear)
        addSubview(buttonSelected)
        addSubview(rightHorizontalBar)
        addSubview(leftHorizontalBar)
        addSubview(titleNear)
        addSubview(titleSelected)
        addSubview(imageView)
        leftButton()
//        buttonNear.addTarget(self, action: #selector(buttons), for: .touchUpInside)
//        buttonSelected.addTarget(self, action: buttons(), for: .touchUpInside)
        buttonNear.snp.makeConstraints { make in
            make.leading.bottom.top.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }
        buttonSelected.snp.makeConstraints { make in
            make.trailing.bottom.top.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }
        titleNear.snp.makeConstraints { make in
            make.center.equalTo(buttonNear.snp.center)
        }
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(15)
            make.trailing.equalTo(titleSelected.snp.leading).inset(-5)
            make.centerY.equalTo(titleSelected.snp.centerY)
        }
        titleSelected.snp.makeConstraints { make in
            make.center.equalTo(buttonSelected.snp.center)
        }
        rightHorizontalBar.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
            make.height.equalTo(2)
            make.width.equalToSuperview().dividedBy(2)
        }
        leftHorizontalBar.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
            make.height.equalTo(2)
            make.width.equalToSuperview().dividedBy(2)
        }
    }
    
    
    @objc func leftButton() {
        imageView.tintColor = Resources.Colors.gray
        titleSelected.textColor = Resources.Colors.gray
        rightHorizontalBar.isHidden = true
        leftHorizontalBar.isHidden = false
        leftHorizontalBar.backgroundColor = Resources.Colors.blue
        
        
        self.delegate?.leftButton{}
        
//        self.delegate?.button {}
    }
    
    @objc func rightButton() {
        imageView.tintColor = Resources.Colors.orange
        titleSelected.textColor = Resources.Colors.orange
        leftHorizontalBar.isHidden = true
        rightHorizontalBar.isHidden = false
        rightHorizontalBar.backgroundColor = Resources.Colors.orange
        self.delegate?.rightButton{}
        
//        self.delegate?.button {}
    }
    
//    func buttons(_ num: Int)-> CollectionViewCompositionalLayout.Section.ButtonTag {
//        return num == 0 ? CollectionViewCompositionalLayout.Section.ButtonTag.near : CollectionViewCompositionalLayout.Section.ButtonTag.selected
//    }
}
