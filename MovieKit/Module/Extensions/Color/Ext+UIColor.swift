//
//  Ext+UIColor.swift
//  MovieDB
//
//  Created by William on 20/12/21.
//

import UIKit

extension UIColor {
    public static func colorMode(light: UIColor, dark: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return light }
        return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
    }
}
