//
//  ForecastViewController.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 16.01.2021.
//

import UIKit
import RealmSwift

class ForecastViewController: UIViewController {
    
    var temps: [Int] = []
    
    let realm = try! Realm()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .darkGray
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(tableView)
        
        if let showForecast = realm.objects(ForecastRealm.self).first {
            for t in showForecast.temps {
                self.temps.append(t)
            }
            tableView.reloadData()
        }
        
        setupTableView()
        
        getForecast()
    }
    
    private func getForecast() {
        Network.shared.getForecast { temps in
            self.temps = temps
            
            let allForecasts = self.realm.objects(ForecastRealm.self)
            for forecast in allForecasts {
                try! self.realm.write {
                    self.realm.delete(forecast)
                }
            }
            
            let forecast = ForecastRealm()
            for t in temps {
                forecast.temps.append(t)
            }
            try! self.realm.write {
                self.realm.add(forecast)
            }
            
            self.tableView.reloadData()
        }
    }
   
    
    private func setupTableView() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = .darkGray
        
        tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: "ForecastCell")
        
        tableView.rowHeight = UIScreen.main.bounds.height / 10
        
    }

}
extension ForecastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temps.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell", for: indexPath) as! ForecastTableViewCell
        
        cell.titleTempLabel.text = "\(temps[indexPath.row])"
        cell.backgroundColor = .darkGray
        
        return cell
    }
}
extension ForecastViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
