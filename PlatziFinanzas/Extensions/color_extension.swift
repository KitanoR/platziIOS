//
//  color_extension.swift
//  PlatziFinanzas
//
//  Created by Cian Coders on 7/7/19.
//  Copyright © 2019 Cian Coders. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    func as1ptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        setFill()
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }
}
