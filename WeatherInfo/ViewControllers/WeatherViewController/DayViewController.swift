//
//  DayViewController.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 6/30/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import UIKit

protocol DayViewControllerDelegate: class {
    func controllerDidTapSettingsButton(controller: DayViewController)
    func controllerDidTapLocationButton(controller: DayViewController)
}

class DayViewController: WeatherViewController {

    var viewModel: DayViewModel? {
        didSet {
            updateView()
        }
    }

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet weak var upperSectionBackgroundImage: UIImageView!
    
    // MARK: -

    weak var delegate: DayViewControllerDelegate?

    // MARK: -

    var now: WeatherData? {
        didSet {
            updateView()
        }
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    // MARK: - Public Interface

    override func reloadData() {
        updateView()
    }

    // MARK: - View Methods

    private func setupView() {

    }

    private func updateView() {
        activityIndicatorView.stopAnimating()
        
        guard
            let viewModel = viewModel
        else {
            messageLabel.isHidden = false
            messageLabel.text = "Cloudy was unable to fetch weather data."
            return
        }
        
        updateWeatherDataContainer(withViewModel: viewModel)
        
    }

    // MARK: -

    private func updateWeatherDataContainer(withViewModel viewModel: DayViewModel) {
        weatherDataContainer.isHidden = false
        
        dateLabel.text = viewModel.date
        timeLabel.text = viewModel.time
        iconImageView.image = viewModel.image
        upperSectionBackgroundImage.image = viewModel.backgroundImage
        windSpeedLabel.text = viewModel.windSpeed
        descriptionLabel.text = viewModel.summary
        temperatureLabel.text = viewModel.temperature
    }

    // MARK: - Actions

    @IBAction func didTapSettingsButton(sender: UIButton) {
        delegate?.controllerDidTapSettingsButton(controller: self)
    }

    @IBAction func didTapLocationButton(sender: UIButton) {
        delegate?.controllerDidTapLocationButton(controller: self)
    }

}
