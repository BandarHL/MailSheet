//
//  MailConfiguringCell.swift
//  Created by Bandar Alruwaili
//

import Foundation

protocol MailSheetConfiguringCell {
    static var reuseIdentifier: String { get }
    func configure(with item: MailSheetItem)
}
