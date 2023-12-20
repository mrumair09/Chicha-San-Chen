//
//  AppConfigurations.swift
//  ChiChaSanChen
//
//  Created by Umair Yousaf on 20/12/2023.
//


import UIKit

class AppConfigurations {

    static let shared : AppConfigurations = AppConfigurations()
    
    private init(){
        
    }
    
    func showAppLaunch(){
        DispatchQueue.main.async {
            Controllers.shared.setupHomeViewController(from: UIApplication.getTopViewController(), callBack: nil)
        }
        
    }
    
    
    
}
