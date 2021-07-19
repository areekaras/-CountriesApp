//
//  CountryDetailsTableViewController.swift
//  CountriesApp
//
//  Created by Shibili Areekara on 18/07/21.
//

import UIKit

class CountryDetailsTableViewController: UITableViewController {
    
    var countryViewModel: CountryProtocol? {
        didSet {
            self.setUpDataSource()
        }
    }
    
    private var dataSource = [CountryDetailCellProtocol]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialiseVC()
    }
    
    private func initialiseVC() {
        self.navigationItem.title = countryViewModel?.name
        self.setUpTableView()
    }
    
    private func setUpTableView() {
        self.registerCustomTableViewCells()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func registerCustomTableViewCells () {
        self.tableView.register(cellType: FlagImageTableViewCell.self)
        self.tableView.register(cellType: CountryDetailsTableViewCell.self)
    }
    
    private func setUpDataSource() {
        dataSource = CountryDetailCellViewModel().getDataSourceArray(countryViewModel: countryViewModel)
    }

}


// MARK: - Table View
extension CountryDetailsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configureCountryTableViewCell(tableView, indexPath)
    }
    
    private func configureCountryTableViewCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        
        let data = dataSource[indexPath.row]
        
        switch data.type {
        case .flag:
            return configureFlagImageTVCell(data, tableView, indexPath)
        default:
            return configureCountryDetailTVCell(data, tableView, indexPath)
        }
    }
    
    private func configureFlagImageTVCell(_ data: CountryDetailCellProtocol, _ tableView: UITableView, _ indexPath: IndexPath)  -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: FlagImageTableViewCell.self, for: indexPath)
        
        cell.viewModel = data
        return cell
    }
    
    private func configureCountryDetailTVCell(_ data: CountryDetailCellProtocol, _ tableView: UITableView, _ indexPath: IndexPath)  -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: CountryDetailsTableViewCell.self, for: indexPath)
    
        cell.viewModel = data
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
