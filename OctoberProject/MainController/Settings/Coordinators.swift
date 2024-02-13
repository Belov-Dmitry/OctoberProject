//
//  Coordinators.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 13.02.2024.
//

import Foundation
import UIKit

protocol Coordinator : AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start()
}
