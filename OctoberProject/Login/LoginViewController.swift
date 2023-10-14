//
//  LoginViewController.swift
//  OctoberProject
//
//  Created by Вячеслав on 08.10.2023.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    private let loginView: LoginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLoginView()
        
        view.backgroundColor = .white
    }
    
    private func initLoginView() {
       
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        loginView.setupUI()
    }
}
