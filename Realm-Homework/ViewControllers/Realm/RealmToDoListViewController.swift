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
        
        tableView.rowHeight = UIScreen.main.bounds.size.width / 20
        
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
    
    private func showSaveAlert() {
        let alertController = UIAlertController(title: "Save", message: "Save net task", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let newTask = alertController.textFields?.first?.text?.trimmingCharacters(in: .whitespaces) else { return }
            if newTask != "" {
                self.tasks.insert(newTask, at: 0)
                self.tableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertController.addTextField { _ in }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        present(alertController, animated: true, completion: nil)
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
