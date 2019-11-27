//
//  TaskListViewController.swift
//  PlanR
//
//  Created by Aisyah Dzulqaidah on 13/08/19.
//  Copyright © 2019 Aisyah Dzulqaidah. All rights reserved.
//

import UIKit
import EventKit

var taskList: TaskListManager = TaskListManager()


class TaskListViewController: UIViewController, TaskViewCellDelegate {
    func reloadData() {
        calendarEvent.getAllEvents(from: "PlanR")
        extraRowCount = 0
        taskTableView.reloadData()
    }
    
    var calendarEvent = CalendarEvent()
    var extraRowCount = 0
    
    @IBOutlet weak var taskTableView: UITableView!

    @IBAction func addNewTask(_ sender: UIButton) {
        extraRowCount = 1
        taskTableView.reloadData()
    }
    
    @IBAction func refreshEvent(_ sender: Any) {
        calendarEvent.getAllEvents(from: "PlanR")
        extraRowCount = 0
        taskTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Task"
        removeFooterCell()
        calendarEvent.getAllEvents(from: "PlanR")
    }
    
    private func removeFooterCell() {
        taskTableView.tableFooterView = UIView()
    }
  
    
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendarEvent.eventTitle.count + extraRowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.taskTableView.dequeueReusableCell(withIdentifier: "taskTableViewCell") as! TaskTableViewCell
        cell.delegate = self
        if indexPath.row == calendarEvent.eventTitle.count {
            cell.task = ""
        } else {
            cell.task = calendarEvent.eventTitle[indexPath.row]
        }
        
        cell.taskView.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            taskTableView.reloadData()
            taskTableView.reloadData()
        }
    }
    
}

