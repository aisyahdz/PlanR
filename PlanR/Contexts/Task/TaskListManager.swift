//
//  TaskListManager.swift
//  PlanR
//
//  Created by Aisyah Dzulqaidah on 30/07/19.
//  Copyright © 2019 Aisyah Dzulqaidah. All rights reserved.
//

import Foundation
var task = [String]()
struct TaskListManager {
    func add(_ taskItem: String){
        task.append(taskItem)
    }
    
    func update(index: Int, taskItem: String){
        task[index] = taskItem
    }
    
    func getItem(index: Int) -> String {
        return task[index]
    }
    
    func deleteItem(index: Int) {
        task.remove(at: index)
    }
    
    func taskCount() -> Int {
        return task.count
    }
    
}

func deleteAllTask(){
    task.removeAll()
}
