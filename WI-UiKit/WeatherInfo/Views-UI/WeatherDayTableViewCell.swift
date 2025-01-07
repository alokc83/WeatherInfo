//
//  WeatherDayTableViewCell.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/3/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import UIKit

class WeatherDayTableViewCell: UITableViewCell {

    static let reuseIdentifier = "WeatherDayCell"

    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!

    // MARK: - Initialization

    override func awakeFromNib() {
        super.awakeFromNib()

        // Configure Cell
        selectionStyle = .none
    }
    
    func configure(with viewModel: WeatherDayViewModel) {
        dayLabel.text = viewModel.day
        dateLabel.text = viewModel.date
        windSpeedLabel.text = viewModel.windSpeed
        temperatureLabel.text = viewModel.temperature
        iconImageView.image = viewModel.image
    }

}
