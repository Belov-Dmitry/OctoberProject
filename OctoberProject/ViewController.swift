//
//  ViewController.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 05.10.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    private let menuBar = MenuBar()
    
    private let text = UIFont.systemFont(ofSize: 18)
    
    private let heightSegment = 87
    private let thickness: CGFloat = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureApperance()
    }
}

private extension ViewController {
    
    func configureApperance() {
        view.addSubview(menuBar)
        
        menuBar.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(heightSegment)
        }
    }
}
