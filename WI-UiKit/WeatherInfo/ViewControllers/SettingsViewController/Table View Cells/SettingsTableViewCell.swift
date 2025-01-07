//
//  SettingsTableViewCell.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/3/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    // MARK: - Type Properties

    static let reuseIdentifier = "SettingsCell"

    // MARK: - Properties

    @IBOutlet var mainLabel: UILabel!

    // MARK: - Initialization

    override func awakeFromNib() {
        super.awakeFromNib()

        // Configure Cell
        selectionStyle = .none
    }

    func configure(with viewModel: SettingsRepresentable) {
        mainLabel.text = viewModel.text
        self.accessoryType = viewModel.accessoryType
    }
}
