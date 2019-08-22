//
//  TaskListViewController.swift
//  PlanR
//
//  Created by Aisyah Dzulqaidah on 13/08/19.
//  Copyright © 2019 Aisyah Dzulqaidah. All rights reserved.
//

import UIKit

var taskList: TaskListManager = TaskListManager()

class TaskListViewController: UIViewController {
    
    @IBOutlet weak var taskTableView: UITableView!

    @IBAction func addNewTask(_ sender: UIButton) {
        taskList.add("")
        taskTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "taskTableViewCell")
        navigationItem.title = "Task"
        removeFooterCell()
    }
    
    private func removeFooterCell(){
        taskTableView.tableFooterView = UIView()
    }
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.taskTableView.dequeueReusableCell(withIdentifier: "taskTableViewCell") as! TaskTableViewCell
        cell.task = taskList.getItem(index: indexPath.row)
        cell.taskView.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            taskTableView.reloadData()
            taskList.deleteItem(index: indexPath.row)
            taskTableView.reloadData()
        }
    }
    
    
}

