//
//  MailSheetSection.swift
//  Created by Bandar Alruwaili
//

import Foundation
import UIKit

public typealias itemAction = (MailSheetItem) -> Void

public struct MailSheetSection: Hashable {
    let id: UUID
    let type: MailSheetType
    var items: [MailSheetItem]
    
    public init(id: UUID = UUID(), type: MailSheetType, items: [MailSheetItem]) {
        self.id = id
        self.type = type
        self.items = items
    }
}

