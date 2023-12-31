//
//  NSBundle+Extension.swift
//  ChiChaSanChen
//
//  Created by Umair Yousaf on 20/12/2023.
//

import Foundation
import UIKit

extension Bundle {
    
    class func getBundle()->Bundle{
        let bundle = Bundle.main
        return bundle
    }
    
    class func loadPathFromResourceAFBundleGIF(imageName:String)->String?{
        let bundle = self.getBundle()
        let fileName = "\(imageName).gif"
        let path = bundle.path(forResource: fileName, ofType: nil)
        return path
    }
    
    class func loadImageFromResourceAFBundlePNG(imageName:String)->UIImage?{
        let bundle = self.getBundle()
        let fileName = "\(imageName).png"
        let image = UIImage(named: fileName, in: bundle, compatibleWith: nil)
        return image
    }
    

}
