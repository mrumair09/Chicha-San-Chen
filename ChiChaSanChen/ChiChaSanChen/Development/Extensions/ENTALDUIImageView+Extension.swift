//
//  UIImageView+Extension.swift
//  ChiChaSanChen
//
//  Created by Umair Yousaf on 20/12/2023.
//

import Foundation
import SDWebImage

extension UIImageView {
    
    func downloadImage(with urlString: String, placeHolderImage: UIImage? = nil, completion: ((UIImage?, Bool) -> Void)? = nil) {
        if urlString.contains("http") {
            sd_setImage(with: URL(string: urlString), placeholderImage: placeHolderImage) { (downloadedImage, _, _, _) in
                completion?(downloadedImage, downloadedImage != nil)
            }
        }
    }
    
}
