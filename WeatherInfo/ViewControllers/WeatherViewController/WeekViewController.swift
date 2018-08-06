//
//  WeekViewController.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 6/30/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import UIKit

protocol WeekViewControllerDelegate {
    func controllerDidRefresh(controller: WeekViewController)
}

class WeekViewController: WeatherViewController {

    // MARK: - Properties

    @IBOutlet var tableView: UITableView!

    // MARK: -

    var delegate: WeekViewControllerDelegate?
    
    // MARK: -

    var viewModel: WeekViewModel? {
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
        setupTableView()
        setupRefreshControl()
    }

    private func updateView() {
        activityIndicatorView.stopAnimating()
        tableView.refreshControl?.endRefreshing()

        guard viewModel != nil
            else {
                messageLabel.isHidden = false
                messageLabel.text = "Cloudy was unable to fetch weather data."
                return
        }
        
         updateWeatherDataContainer()
    }

    // MARK: -

    private func setupTableView() {
        tableView.separatorInset = UIEdgeInsets.zero
    }

    private func setupRefreshControl() {
        let refreshControl = UIRefreshControl()

        refreshControl.addTarget(self, action: #selector(WeekViewController.didRefresh(sender:)), for: .valueChanged)

        tableView.refreshControl = refreshControl
    }

    // MARK: -

    private func updateWeatherDataContainer() {
        weatherDataContainer.isHidden = false

        tableView.reloadData()
    }

    // MARK: - Actions
    @objc func didRefresh(sender: UIRefreshControl) {
        delegate?.controllerDidRefresh(controller: self)
    }
    
}

extension WeekViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        guard
            let viewModel = viewModel
        else { return 0 }
        return viewModel.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard
            let viewModel = viewModel
        else { return 0 }
        return viewModel.numberOfRowsInSection
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDayTableViewCell.reuseIdentifier, for: indexPath) as? WeatherDayTableViewCell else { fatalError("Unexpected Table View Cell") }

        if let viewModel = viewModel?.viewModel(for: indexPath.row) {
            cell.configure(with: viewModel)
        }
        return cell
    }

}
