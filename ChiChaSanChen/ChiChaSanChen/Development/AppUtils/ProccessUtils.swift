//
//  ProccessUtils.swift
//  ChiChaSanChen
//
//  Created by Umair Yousaf on 20/12/2023.
//

import UIKit

class ProcessUtils {
    
    static let shared : ProcessUtils = ProcessUtils()
    
    private init() {
        
    }
    
//    var contactInfo : UserIdentityModel?
    var tokenTime : Date = Date()
    var tabbarHeight : CGFloat?
    
    
//    func refreshToken(completion:@escaping (_ status: Bool)->Void){
//        
//        let params : DynamicAuthRequest = DynamicAuthRequest(grant_type: "client_credentials", client_id: "e0508903-f48f-418c-ad61-7a2f38ff50a4", resource: "https://sja-sandbox.crm3.dynamics.com/", client_secret: "82a8Q~inojTl~emDlThirKD6TEV64PG0EH_rccGW")
//        
//        LibraryAPI.shared.requestDynamicAuth(params: params) { result in
//            
//            switch result {
//            case .success(let response):
//                if let token = response.access_token {
//                    UserDefaults.standard.authToken = token
//                    UserDefaults.standard.tokenExpireTime = response.expires_on
//                    completion(true)
//                }
//                break
//            case .error(let error, let errorResponse):
//                var message = error.message
//                if let err = errorResponse {
//                    message = err.error
//                }
//                DispatchQueue.main.async {
//                    AlertView.shared.showAPIAlertWithTitle(title: "", message: message, actionTitle: .KOK, completion: {status in })
//                }
//                completion(false)
//            }
//        }
//    }
    
//    func shouldRefreshToken()->Bool{
//        if let dateStr = UserDefaults.standard.tokenExpireTime {
//            let expiryDate = DateFormatManager.shared.getDateFromUnixCode(date: dateStr)
//            let currentDate = DateFormatManager.shared.getCurrentDate()
//            let difference = expiryDate.timeIntervalSince(currentDate)
//            
//            if difference <= 300 {
//                return true
//            }
//        }
//        
//        return false
//    }
    
    func getMessageImage()->UIImage{
        
        var img = UIImage(named: "messages-bubble-square-text")
        if (UserDefaults.standard.isDarkMode){
//            img = img?.withRenderingMode(.alwaysTemplate)
//            img?.withTintColor(UIColor.themePrimaryColor)
            img = img?.withTintColor((UIColor.themePrimaryColor), renderingMode: .alwaysTemplate)
            return img ?? UIImage()
        }else{
//            img = img?.withRenderingMode(.alwaysTemplate)
            img = img?.withTintColor((UIColor.themePrimaryColor), renderingMode: .alwaysTemplate)
//            img?.withTintColor(UIColor.headerGreen)
            return img ?? UIImage()
        }
    }
    
    func tintImage(_ originalImage: UIImage) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(originalImage.size, false, originalImage.scale)
        var tintColor : UIColor! ;
        if (UserDefaults.standard.isDarkMode){
          tintColor =  UIColor.themePrimaryColor
            
        }else{
            tintColor =  UIColor.themePrimaryColor
        }
            
        tintColor.set()
        
        let bounds = CGRect(x: 0, y: 0, width: originalImage.size.width, height: originalImage.size.height)
        UIRectFill(bounds)
        
        originalImage.draw(in: bounds, blendMode: .destinationIn, alpha: 1.0)
        
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return tintedImage ?? originalImage
    }
}

