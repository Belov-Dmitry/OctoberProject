//
//  MessageCell.swift
//  OctoberProject
//
//  Created by Mishana on 19.10.2023.
//

import UIKit
import SnapKit

final class MessageCell: UICollectionViewCell {
    
    static let cellIDNear = "MessageCellNear"
    static let cellIDSelected = "MessageCellSelected"
    
    private var avatar: UIImageView = {
       let image = UIImageView()
        image.layer.cornerRadius = 32
        return image
    }()
    
    private let borderStar: UIImageView = {
        let image = UIImageView()
        image.image = Resources.Images.MessageCollectionCell.starFill?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        return image
    }()
    
    private let star: UIImageView = {
        let image = UIImageView()
        image.image = Resources.Images.MessageCollectionCell.starFill
        image.tintColor = .white
        return image
    }()
    
    private let borderOnline: UIImageView = {
        let image = UIImageView()
        image.image = Resources.Images.MessageCollectionCell.online
        image.tintColor = .white
        return image
    }()
    
    private var onlineStatus: UIImageView = {
        let image = UIImageView()
        image.image = Resources.Images.MessageCollectionCell.online?.withRenderingMode(.alwaysTemplate)
//        image.tintColor = .systemGreen
        return image
    }()
    
    private var titleName: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return text
    }()
    
    private var subTitle: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return text
    }()
    
    private var locationTitle: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        text.text = "500 м от вас"
        return text
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
       configureAppearance()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension MessageCell {
    func setTitleImage(image: UIImage,
                       title: String,
                       subT: String,
                       location: String,
                       starSelect: Bool,
                       onlineStatusB: Bool) {
        avatar.image = image
        titleName.text = title
        subTitle.text = subT
        locationTitle.text = location
        star.isHidden = starSelect ? false : true
        borderStar.isHidden = starSelect ? false : true
        onlineStatus.tintColor = onlineStatusB ? Resources.Colors.green : Resources.Colors.darkGray
    }
}


private extension MessageCell {
    func configureAppearance() {
        addSubview(avatar)
        addSubview(titleName)
        addSubview(subTitle)
        addSubview(locationTitle)
        addSubview(borderStar)
        addSubview(star)
        addSubview(borderOnline)
        addSubview(onlineStatus)
        avatar.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.height.width.equalTo(65)
        }
        

        titleName.snp.makeConstraints { make in
            make.leading.equalTo(avatar.snp.trailing).inset(-10)
            make.top.equalTo(avatar.snp.top).inset(10)
        }
        subTitle.snp.makeConstraints { make in
            make.leading.equalTo(avatar.snp.trailing).inset(-10)
            make.bottom.equalTo(avatar.snp.bottom).inset(9)
        }
        locationTitle.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom).inset(9)
        }
        borderStar.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.bottom.equalTo(self.snp.bottom)
            make.height.width.equalTo(21)
        }
        star.snp.makeConstraints { make in
            make.height.width.equalTo(15)
            make.center.equalTo(borderStar.snp.center)
        }
        borderOnline.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom)
            make.trailing.equalTo(avatar.snp.trailing)
            make.height.width.equalTo(17)
        }
        onlineStatus.snp.makeConstraints { make in
            make.height.width.equalTo(11)
            make.center.equalTo(borderOnline.snp.center)
        }
    }
}

import SwiftUI

struct ViewControllerPreview: UIViewControllerRepresentable {
    let viewControllerGenerator: () -> UIViewController

    init(viewControllerGenerator: @escaping () -> UIViewController) {
        self.viewControllerGenerator = viewControllerGenerator
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        viewControllerGenerator()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}


struct ViewControllerPrevider: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            MessageViewController()
        }.edgesIgnoringSafeArea(.all)
    }
}
