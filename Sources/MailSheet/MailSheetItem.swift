//
//  MailSheetItem.swift
//  Created by Bandar Alruwaili
//

import Foundation
import UIKit

public struct MailSheetItem: Hashable {
    let id: UUID
    let title: String
    let image: UIImage
    let action: itemAction
    
    public init(id: UUID = UUID(), title: String, image: UIImage, action: @escaping itemAction) {
        self.id = id
        self.title = title
        self.image = image
        self.action = action
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: MailSheetItem, rhs: MailSheetItem) -> Bool {
        return lhs.id.hashValue == rhs.id.hashValue
    }
}
