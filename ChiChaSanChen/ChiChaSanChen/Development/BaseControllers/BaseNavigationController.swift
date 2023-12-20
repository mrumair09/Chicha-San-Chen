//
//  BaseNavigationController.swift
//  ChiChaSanChen
//
//  Created by Umair Yousaf on 20/12/2023.
//

import UIKit

class BaseNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    var navigationBarTintColor: UIColor = .blue {
        didSet {
            navigationBar.barTintColor = navigationBarTintColor
        }
    }
    var navigationTintColor: UIColor = .blue {
        didSet {
            navigationBar.tintColor = navigationTintColor
        }
    }
    
    var navigationBarTitleColor: UIColor = .white {
        didSet {
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : navigationBarTitleColor]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}
