//
//  CoreDataViewController.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 19.01.2021.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .darkGray
        return table
    }()
    
    var tasks: [TaskCoreData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setConfigTableView()
        setConfigNavBar()
        showTasksCoreData()
    }
    
    private func showTasksCoreData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<TaskCoreData> = TaskCoreData.fetchRequest()
        
        do {
            tasks = try context.fetch(fetchRequest)
        }catch let error {
            print(error)
        } 
    }
    
    
    private func deleteTask(_ objc: NSManagedObject) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(objc)
        
        do {
            try context.save()
        }catch(let error) {
            print(error)
        }
    }

    private func updateTask(isCheck: Bool, objc: TaskCoreData) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskCoreData")
        fetchRequest.predicate = NSPredicate(format: "nameTask = %@", objc.nameTask as! CVarArg)
        
        let fethcResult = try? context.fetch(fetchRequest) as? [TaskCoreData]
        
        fethcResult?.forEach { coredataTask in
            coredataTask.isCheckBox = isCheck
        }
        try? context.save()
    }
    
    private func saveCoreData(withTitle title: String, isCheckBox: Bool = false) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "TaskCoreData", in: context) else { return }
        
        let taskObject = TaskCoreData(entity: entity, insertInto: context)
        taskObject.nameTask = title
        taskObject.isCheckBox = isCheckBox
        
        do {
            try context.save()
            self.tasks.insert(taskObject, at: 0)
        }catch let error {
            print(error)
        }
    }
    
    private func setConfigTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.register(CoreDataTableViewCell.self, forCellReuseIdentifier: "CoreDataCell")
    }
    private func setConfigNavBar() {
        title = "ToDoList"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTask))
        navigationController?.navigationBar.barTintColor = .black 
        navigationItem.rightBarButtonItem?.tintColor = .red
    }
    
    private func showSaveAlert() {
        let alertController = UIAlertController(title: "New task", message: "Please, input new task", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            let newTask = alertController.textFields?.first?.text?.trimmingCharacters(in: .whitespaces)
            guard let nameTask = newTask else { return }
            if nameTask != "" {
                self.saveCoreData(withTitle: nameTask)
                self.tableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        alertController.addTextField { _ in }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func addNewTask(_ sender: UIBarButtonItem) {
        showSaveAlert()
    }
    
}

extension CoreDataViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoreDataCell", for: indexPath) as! CoreDataTableViewCell
        
        let model = tasks[indexPath.row]
        
        if model.isCheckBox {
            cell.checkBox.backgroundColor = .red
            cell.nameTaskLabel.text = model.nameTask
            cell.backgroundColor = .darkGray
            
            return cell
        }
        
        cell.nameTaskLabel.text = model.nameTask
        cell.checkBox.backgroundColor = .darkGray
        
        cell.backgroundColor = .darkGray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            self.deleteTask(tasks[indexPath.row])
            
            self.tasks.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let editTask = tasks[indexPath.row]
        editTask.isCheckBox = !editTask.isCheckBox
        
        updateTask(isCheck: editTask.isCheckBox, objc: editTask)
        
        tableView.reloadData()
    }
}
