//
//  TaskListViewController.swift
//  PlanR
//
//  Created by Aisyah Dzulqaidah on 13/08/19.
//  Copyright © 2019 Aisyah Dzulqaidah. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController {
    
    var taskList = ["Mengerjakan Tugas", "Tidur", "Mandi"]
    
    @IBOutlet weak var taskTableView: UITableView!
    @IBAction func addNewTask(_ sender: UIButton) {
        taskList.append("")
        taskTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "taskTableViewCell")
        taskTableView.tableFooterView = UIView()

    }
    
}

extension TaskListViewController: UITableViewDelegate {
    
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = self.taskTableView.dequeueReusableCell(withIdentifier: "taskCell")
//        cell?.textLabel?.text = taskList[indexPath.row]
//        return cell ?? UITableViewCell()
        
        let cell = self.taskTableView.dequeueReusableCell(withIdentifier: "taskTableViewCell") as! TaskTableViewCell
        cell.task = taskList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.taskList.remove(at: indexPath.row)
            taskTableView.reloadData()
        }
    }
    
    
}

