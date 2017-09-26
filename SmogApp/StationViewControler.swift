//
//  StationViewControler.swift
//  SmogApp
//
//  Created by Tomasz Machlowski on 25/09/2017.
//  Copyright © 2017 Tomasz Machlowski. All rights reserved.
//

import UIKit

class StationViewControler: UITableViewController, ChoseCityViewControllerDelegate {
    var stations: [StationModel] {
        return _stations.filter {
            guard let filter = cityFilterValue, let city = $0.city else { return true }
            return city.name.caseInsensitiveCompare(filter) == ComparisonResult.orderedSame
        }
    }
    
    var _stations:  [StationModel] = []
    var cityFilterValue: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllStations()
    }
    
    func getAllStations() {
        ApiClient.shared.getAllStations().then { [weak self] result -> Void in
            self?._stations = result
            self?.tableView.reloadData()
        }.catch { error in
            print(error.localizedDescription)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section == 0 else { return 0 }
        return stations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "stationCell", for: indexPath) as? StationTableViewCell else { return UITableViewCell() }
        cell.configure(with: stations[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationViewController =  storyboard?.instantiateViewController(withIdentifier: "IndexesViewController") as! IndexesViewController
        destinationViewController.currentStationId = stations[indexPath.row].id
        show(destinationViewController, sender: self)
    }
    
    @IBAction func presentFilerView() {
        let destinationViewController =  storyboard?.instantiateViewController(withIdentifier: "ChoseCityViewController") as! ChoseCityViewController
        destinationViewController.delegate = self
        modalPresentationStyle =  .overFullScreen
        modalTransitionStyle = .crossDissolve
        present(destinationViewController, animated: true, completion: nil)
    }
    
    func didChooseCity(_ city: String?) {
        self.cityFilterValue = city
        tableView.reloadData()
    }
}

