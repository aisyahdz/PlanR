//
//  TaskListManager.swift
//  PlanR
//
//  Created by Aisyah Dzulqaidah on 30/07/19.
//  Copyright © 2019 Aisyah Dzulqaidah. All rights reserved.
//

import Foundation

private var task  = [TaskItem]()

struct TaskItem: Equatable {
    let task: String
    let dueDate: Date

}



struct TaskListManager {
    var count: Int {
        return task.count
    }
    func add(_ taskItem: TaskItem){
        task.append(taskItem)
    }
    
    func update(index: Int, taskItem: TaskItem){
        task[index] = taskItem
    }
    
    func getItem(index: Int) -> TaskItem {
        return task[index]
    }
    
    func deleteItem(index: Int) {
        task.remove(at: index)
    }
    
    func isEmpty() -> Bool {
        return task.isEmpty
    }
    
}

func deleteAllTask(){
    task.removeAll()
}
