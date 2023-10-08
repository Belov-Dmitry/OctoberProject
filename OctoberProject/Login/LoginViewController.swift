//
//  LoginViewController.swift
//  OctoberProject
//
//  Created by Вячеслав on 08.10.2023.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLoginView()
        
        view.backgroundColor = .white
    }
    
    private func initLoginView() {
        let loginView = LoginView()
        view.addSubview(loginView)
        loginView.setupUI()
    }
}
