//
//  RealmToDoListViewController.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 15.01.2021.
//

import UIKit

class RealmToDoListViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .darkGray
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var tasks: [String] = ["eat burger", "bux bread", "check car"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        view.addSubview(tableView)
        
        setConfigTableView()
    }
    
    private func setConfigTableView() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RealmToDoListViewControllerCell")
    }
    
}

extension RealmToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RealmToDoListViewControllerCell") as! RealmToDoTableViewCell

        cell.title.text = tasks[indexPath.row]

        return cell
    }
}
