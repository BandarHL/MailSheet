//
//  ColorExtenstion.swift
//  Created by Bandar Alruwaili on 08/03/2023.
//

import Foundation
import UIKit

extension UIColor {
    static var sheetCellColor: UIColor {
        UIColor { $0.userInterfaceStyle == .dark ? UIColor(red: 47.0/255.0, green: 46.0/255.0, blue: 46.0/255.0, alpha: 1.0) : .white }
    }
    static var sheetViewController: UIColor {
        UIColor { $0.userInterfaceStyle == .dark ? .systemBackground : .secondarySystemBackground }
    }
}
