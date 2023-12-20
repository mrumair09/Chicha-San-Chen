//
//  Controllers.swift
//  ChiChaSanChen
//
//  Created by Umair Yousaf on 20/12/2023.
//

import UIKit

enum ControllerType {
    case PUSH
    case PRESENT
    case PUSH_WO_ANIM
    case PRESENT_WO_ANIM
    case TABBARVC
    case MODAL_PRESENT
    case PRESENT_OVER_CONTEXT
    case PRESENT_POPOVER
}

class Controllers {
    static let shared : Controllers = Controllers()
    
    private init(){
        
    }
    
    
    func setupHomeViewController(from:UIViewController?, _ dataObj:Any? = nil, callBack:ControllerCallBackCompletion?){
        self.startFlowFromSplash(from: from, dataObj, callBack: callBack)
    }
    
    func startFlowFromSplash(from:UIViewController?, _ dataObj:Any? = nil, callBack:ControllerCallBackCompletion?){

//        if HelperUtils.isUserLoggedIn() && UserDefaults.standard.staySignedIn {
            
            self.startFlowfromLandingScreen(from: from, callBack: callBack)
//            
//        }else{
//            self.showLoginScreen(type: .PUSH, from: UIApplication.getTopViewController()) { params, controller in
//                
//                if HelperUtils.isUserLoggedIn() {
//                    self.startFlowfromLandingScreen(from: from, callBack: callBack)
//                }
//            }
//        }
    }
    
    func startFlowfromLandingScreen(from:UIViewController?, _ dataObj:Any? = nil, callBack:ControllerCallBackCompletion?){
        
//        ProcessUtils.shared.refreshToken { status in
//            if status {
                DispatchQueue.main.async{
                    
                    self.showTabbarViewController(type: .PUSH, from: from) { params, controller in
                        
                    }
                }
//            }
//        }
    }
    
    func showLandingScreen(type: ControllerType, from:UIViewController?, isNavigationController:Bool = false, _ dataObj:Any? = nil, callBack:ControllerCallBackCompletion?) {
//        let vc = LandingVC.loadFromNib()
//        vc.callbackToController = callBack
//        let nav = BaseNavigationController(rootViewController: vc)
//        
//        if let window = sceneDelegate?.window{
//            window.rootViewController = nav
//            window.makeKeyAndVisible()
//            window.windowLevel = .normal
//        }
    }
    
    func showTabbarViewController(type: ControllerType, from:UIViewController?, isNavigationController:Bool = false, _ dataObj:Any? = nil, callBack:ControllerCallBackCompletion?){
        
        let tabbar = HomeVC()
        tabbar.callbackToController = callBack
        
        let nav = BaseNavigationController(rootViewController: tabbar)
        
        if let window = sceneDelegate?.window{
            window.rootViewController = nav
            window.makeKeyAndVisible()
            window.windowLevel = .normal
        }
    }
    
//    func showLoginScreen(type: ENTALDControllerType, from:UIViewController?, isNavigationController:Bool = false, _ dataObj:Any? = nil, callBack:ControllerCallBackCompletion?) {
//        let vc = LoginVC.loadFromNib()
//        vc.callbackToController = callBack
//        let nav = ENTALDBaseNavigationController(rootViewController: vc)
//        
//        if let window = sceneDelegate?.window{
//            window.rootViewController = nav
//            window.makeKeyAndVisible()
//            window.windowLevel = .normal
//        }
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func showViewController(navRoot: Bool, type: ControllerType, destination: BaseViewController, from: UIViewController? = nil, isDisplayonTop:Bool = false, completion: (() -> ())? = nil) {
        
        let isAnimation = type == .PRESENT || type == .PUSH
        
        if navRoot {
            let navController : BaseNavigationController = BaseNavigationController(rootViewController: destination)
            
            if destination.definesPresentationContext == true && destination.providesPresentationContextTransitionStyle == true {
                navController.modalPresentationStyle = .overCurrentContext
            }
            
            if type == .PUSH || type == .PUSH_WO_ANIM {
                from?.navigationController?.pushViewController(destination, animated: isAnimation)
            } else if type == .PRESENT || type == .PRESENT_WO_ANIM {
                if isDisplayonTop {
                    UIApplication.getTopViewController()?.present(navController, animated: isAnimation, completion: nil)
                }else{
                    navController.modalPresentationStyle = .fullScreen
                    from?.present(navController, animated: isAnimation, completion: completion)
                }
            }else if type == .PRESENT_OVER_CONTEXT {
                navController.modalPresentationStyle = .overCurrentContext
                from?.present(navController, animated: isAnimation, completion: completion)
            }
        } else {
            destination.modalPresentationStyle = .fullScreen
            if type == .PUSH || type == .PUSH_WO_ANIM {
                from?.navigationController?.pushViewController(destination, animated: isAnimation)
            }else if type == .PRESENT || type == .PRESENT_WO_ANIM {
                if isDisplayonTop {
                    UIApplication.getTopViewController()?.present(destination, animated: isAnimation, completion: nil)
                }else{
                    from?.present(destination, animated: isAnimation, completion: completion)
                }
            }else if type == .MODAL_PRESENT {
                //                [controller presentPanModal:actionController];
            }else if type == .PRESENT_OVER_CONTEXT {
                destination.modalPresentationStyle = .overCurrentContext
                from?.present(destination, animated: isAnimation, completion: completion)
            }else if type == .PRESENT_POPOVER {
                destination.modalPresentationStyle = .popover
                from?.present(destination, animated: isAnimation, completion: completion)
            }
        }
    }
}
