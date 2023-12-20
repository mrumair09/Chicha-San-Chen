//
//  AlertView.swift
//  ChiChaSanChen
//
//  Created by Umair Yousaf on 20/12/2023.
//

import UIKit
import SCLAlertView

enum ActionTitle {
    case KRELOAD
    case KOK
    case KCANCEL
    
    func getTitleString()->String{
        switch self {
        case .KRELOAD:
            return "reload_button".localized
        case .KOK:
            return "ok_button".localized
        case .KCANCEL:
            return "cancel_button".localized
        }
    }
}
   

class AlertView: UIView {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var imgIcon: UIImageView!
    
    static let shared : AlertView = AlertView.sharedInit(.zero)
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
//    override private init(frame: CGRect) {
//        super.init(frame: frame)
//        self.sharedInit()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        self.sharedInit()
//    }
//
    class private func sharedInit(_ size:CGSize)->AlertView{
        let view = Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)?.first as! AlertView
        view.frame.size = size
        return view
    }
    
    func showAPIAlertWithTitle(title:String?, message:String?, actionTitle:ActionTitle, completion: @escaping(_ status:Bool)->Void){
        let appearence = SCLAlertView.SCLAppearance(
            kWindowWidth : SCREEN_WIDTH * 0.80,
            kTitleFont: UIFont.MediumFont(20.0),
            kTextFont: UIFont.BoldFont(16.0),
            showCloseButton: false,
            showCircularIcon : false
        )
        let alert = SCLAlertView(appearance: appearence)
        alert.addButton(actionTitle.getTitleString(), backgroundColor: UIColor.red, textColor: UIColor.white) {
            switch actionTitle {
            case .KRELOAD:
                completion(true)
            default:
                completion(false)
            }
        }
        
        alert.showSuccess(title ?? "", subTitle: message ?? "")
    }
    
    private func showAlertWithFrame(){
        
        var width = SCREEN_WIDTH * 0.85
        var height = 170 + self.lblTitle.bounds.size.height;
        
        if (width > 330) {
            width = 330;
        } else if (width < 250) {
            width = 250;
        }

        if (height > 320) {
            height = 200;
        } else if (width < 300) {
            height = 300;
        }
        
    }
    
    func showContactAlertWithTitle(title:String?, message:String?, actionTitle:ActionTitle, completion: @escaping(_ status:Bool)->Void){
        let appearence = SCLAlertView.SCLAppearance(
            kWindowWidth : SCREEN_WIDTH * 0.80,
            kTitleFont: UIFont.MediumFont(20.0),
            kTextFont: UIFont.BoldFont(16.0),
            showCloseButton: false,
            showCircularIcon : false
        )
        let alert = SCLAlertView(appearance: appearence)
        alert.addButton(actionTitle.getTitleString(), backgroundColor: UIColor.themePrimaryColor, textColor: UIColor.white) {
            switch actionTitle {
            case .KRELOAD:
                completion(true)
            default:
                completion(false)
            }
        }
        
        alert.showSuccess(title ?? "", subTitle: message ?? "")
    }
    
    func showActionAlertWithTitle(title:String?, message:String?, actionTitle:ActionTitle, completion: @escaping(_ status:Bool)->Void){
        let appearence = SCLAlertView.SCLAppearance(
            kWindowWidth : SCREEN_WIDTH * 0.80,
            kTitleFont: UIFont.MediumFont(20.0),
            kTextFont: UIFont.BoldFont(16.0),
            showCloseButton: false,
            showCircularIcon : false
        )
        let alert = SCLAlertView(appearance: appearence)
        alert.addButton(actionTitle.getTitleString(), backgroundColor: UIColor.themePrimaryColor, textColor: UIColor.white) {
            switch actionTitle {
            case .KOK:
                completion(true)
            default:
                completion(false)
            }
        }
        alert.addButton("Cancel", backgroundColor: UIColor.themePrimaryColor, textColor: UIColor.white) {
            switch actionTitle {
            case .KCANCEL:
                completion(false)
            default:
                completion(false)
            }
        }
        
        alert.showSuccess(title ?? "", subTitle: message ?? "")
    }
    
}
