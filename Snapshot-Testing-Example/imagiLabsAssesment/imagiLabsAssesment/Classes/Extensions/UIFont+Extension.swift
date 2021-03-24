//
//  UIFont+Extension.swift
//  imagiLabsAssesment
//
//  Created by Csongor G. Korosi on 05/05/2020.
//  Copyright © 2020 Csongor Korosi. All rights reserved.
//

import Foundation
import UIKit

// Contains all the fonts used in the app
extension UIFont {
    static func montserratExtraBoldFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: "Montserrat-ExtraBold", size: fontSize)
    }
    
    static func avenirNextRegularFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: "AvenirNext-Regular", size: fontSize)
    }
}
