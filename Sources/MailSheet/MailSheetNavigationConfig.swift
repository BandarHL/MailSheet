//
//  MailSheetNavigationConfig.swift
//  Created by Bandar Alruwaili
//

import Foundation
import UIKit

public struct MailSheetNavigationConfig {
    let title: String
    let subtitle: String
    let image: UIImage
    
    public init(title: String, subtitle: String, image: UIImage) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}

