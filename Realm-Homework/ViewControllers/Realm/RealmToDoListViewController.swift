//
//  RealmToDoListViewController.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 15.01.2021.
//

import UIKit
import RealmSwift

class RealmToDoListViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .darkGray
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var tasks: [TaskRealm] = []
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        view.addSubview(tableView)
        
        tableView.rowHeight = 60
        
        showAllTasks()
        
        setConfigTableView()
        setNavBar()
    }
    
    private func showAllTasks() {
        let allTasks = realm.objects(TaskRealm.self)
        for task in allTasks {
            tasks.insert(task, at: 0)
        }
        tableView.reloadData()
    }
    
    private func setConfigTableView() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(RealmToDoTableViewCell.self, forCellReuseIdentifier: "RealmToDoListViewControllerCell")
    }
    private func setNavBar() {
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        title = "ToDoList"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        navigationItem.rightBarButtonItem?.tintColor = .red
    }
    
    private func showSaveAlert() {
        let alertController = UIAlertController(title: "Save", message: "Save new task", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let nameTask = alertController.textFields?.first?.text else { return }
            let taskTitle = nameTask.trimmingCharacters(in: .whitespaces)
            if taskTitle != "" {
                let task = TaskRealm()
                task.title = taskTitle
                task.isCheckBox = false
                
                try! self.realm.write {
                    self.realm.add(task)
                }
                
                self.tasks.insert(task, at: 0)
                self.tableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addTextField { _ in }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func addTask(_ sender: UIBarButtonItem) {
        showSaveAlert()
    }
}

extension RealmToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RealmToDoListViewControllerCell") as! RealmToDoTableViewCell
        let task = tasks[indexPath.row]
        cell.checkBox.isOn = task.isCheckBox
        cell.title.text = task.title
        cell.backgroundColor = .darkGray

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        

        try! realm.write {
            let editTask = tasks[indexPath.row]
            editTask.isCheckBox = !editTask.isCheckBox
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let realmDeleteTask = realm.objects(TaskRealm.self).filter { $0.title == self.tasks[indexPath.row].title }.first
            if let deleteTask = realmDeleteTask {
                try! self.realm.write {
                    self.realm.delete(deleteTask)
                }
            }
            
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
}
