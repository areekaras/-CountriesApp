//
//  ViewController.swift
//  CountriesApp
//
//  Created by Shibili Areekara on 18/07/21.
//

import UIKit

class CountriesTableViewController: UITableViewController,StoryBoardInitiable {
    static var storyBoardName: EXStorBoardName { .default }
    
    private var countryViewModels = [CountryProtocol]()
    
    var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialiseVC()
        self.fetchData()
    }
    
    private func initialiseVC() {
        self.setUpTableView()
        self.setUpRefreshControl()
    }
    
    private func setUpTableView() {
        self.registerCustomTableViewCells()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setUpRefreshControl() {
        self.refreshControl?.addTarget(self, action: #selector(fetchData), for: UIControl.Event.valueChanged)
    }
    
    private func registerCustomTableViewCells () {
        self.tableView.register(cellType: CountryTableViewCell.self)
    }

    @objc private func fetchData() {
        Network().fetchData() { [unowned self] (countryModels) in
            self.countryViewModels.removeAll()
            self.countryViewModels.insert(contentsOf: countryModels.map({
                return CountryViewModel(country: $0)
            }), at: 0)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
 
            }
        }
    }
}

// MARK: - Table View Data Source
extension CountriesTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.countryViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configureCountryTableViewCell(tableView, indexPath)
    }
    
    fileprivate func configureCountryTableViewCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: CountryTableViewCell.self, for: indexPath)
        cell.countryViewModel = countryViewModels[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.showCountryDetailView(countryViewModels[indexPath.row])
    }
}
