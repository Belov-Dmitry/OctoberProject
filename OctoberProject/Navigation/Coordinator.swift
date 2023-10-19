//
//  Coordinators.swift
//  OctoberProject
//
//  Created by Вячеслав on 20.10.2023.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
