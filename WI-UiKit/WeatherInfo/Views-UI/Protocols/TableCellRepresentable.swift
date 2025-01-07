//
//  TableCellRepresentable.swift
//  WeatherInfo
//
//  Created by Alok Choudhary on 8/7/18.
//  Copyright © 2018 Mt Aden LLC. All rights reserved.
//

import UIKit

protocol TableViewCellRepresentable {
    var cellHeight: CGFloat { get }
    func tableCellInstance(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}
