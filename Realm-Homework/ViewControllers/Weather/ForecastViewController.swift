//
//  ForecastViewController.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 16.01.2021.
//

import UIKit

class ForecastViewController: UIViewController {
    
    var temps: [Int] = []
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .darkGray
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        setupTableView()
   
    }
   
    
    private func setupTableView() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ForecastCell")
        
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
        
        return cell
    }
}
extension ForecastViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
