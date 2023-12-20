//
//  BaseViewController.swift
//  ChiChaSanChen
//
//  Created by Umair Yousaf on 20/12/2023.
//

import UIKit
import IQKeyboardManagerSwift

enum RefreshDataObserverType{
    
}

class BaseViewController: UIViewController {
   
    var callbackToController : ControllerCallBackCompletion?
    var dataModel: Any?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        let currentTraitCollection = UITraitCollection.current
        if (UserDefaults.standard.isSystemPrefernceTheme == false){
            return UserDefaults.standard.isDarkMode ? .lightContent : .darkContent
        }else{
            if currentTraitCollection.userInterfaceStyle == .light {
                return .darkContent
            } else if currentTraitCollection.userInterfaceStyle == .dark {
                return .lightContent
            }
        }
        return .lightContent
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerReloadDataNotifications()
        self.navigationController?.navigationBar.isHidden = true
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        if (UserDefaults.standard.isSystemPrefernceTheme == true){
            setSystemAppearanceMode()
        }else{
            setAppearanceDarkLightMode()
        }
    }
    
        
    func setAppearanceDarkLightMode() {
        UITabBar.appearance().overrideUserInterfaceStyle = UserDefaults.standard.isDarkMode ? .dark : .light
        UIView.appearance().overrideUserInterfaceStyle = UserDefaults.standard.isDarkMode ? .dark : .light
        UINavigationBar.appearance().overrideUserInterfaceStyle = UserDefaults.standard.isDarkMode ? .dark : .light
        let windows = UIApplication.shared.windows
        for window in windows {
            if NSStringFromClass(window.classForCoder) == "UITextEffectsWindow" {
                    NSLog("===== Ignore UITextEffectsWindow")

                    return
                }
            for view in window.subviews {
                view.removeFromSuperview()
                window.addSubview(view)
            }
        }
    }
    
    
func setSystemAppearanceMode() {
    let currentTraitCollection = UITraitCollection.current
    if currentTraitCollection.userInterfaceStyle == .light {
        
        UITabBar.appearance().overrideUserInterfaceStyle = .light
        UIView.appearance().overrideUserInterfaceStyle = .light
        UINavigationBar.appearance().overrideUserInterfaceStyle = .light
        
    } else if currentTraitCollection.userInterfaceStyle == .dark {
        UITabBar.appearance().overrideUserInterfaceStyle = .dark
        UIView.appearance().overrideUserInterfaceStyle = .dark
        UINavigationBar.appearance().overrideUserInterfaceStyle = .dark

    }

    let windows = UIApplication.shared.windows
    for window in windows {
        if NSStringFromClass(window.classForCoder) == "UITextEffectsWindow" {
                NSLog("===== Ignore UITextEffectsWindow")

                return
            }
        for view in window.subviews {
            view.removeFromSuperview()
            window.addSubview(view)
        }
    }
    self.setNeedsStatusBarAppearanceUpdate()
}
    
    private func registerReloadDataNotifications(){
//        NotificationCenter.default.addObserver(self, selector: #selector(userDidChangedStatus), name: Notification.Name(rawValue: ObserverNameConstants.nameStatusChangedNotification), object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(userDidUpdateLocationPermission), name: Notification.Name(rawValue: ObserverNameConstants.locationStatusUpdated), object: nil)
        
    }
    
    @objc
    func userDidChangedStatus(){
        
    }
    
    @objc
    func userDidUpdateLocationPermission(){
        
    }
    
}

extension BaseViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
