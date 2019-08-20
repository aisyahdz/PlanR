//
//  TaskListManagerTest.swift
//  PlanRTests
//
//  Created by Aisyah Dzulqaidah on 09/08/19.
//  Copyright © 2019 Aisyah Dzulqaidah. All rights reserved.
//

import XCTest
@testable import PlanR

class TaskListManagerTest: XCTestCase {
    
    override func setUp() {
        deleteAllTask()
    }

    func testAddingNewTaskInEmptyTaskListWillAddNewItemInFirstIndex(){
        let taskList = TaskListManager()
        let task = "Makan"
        taskList.add(task)
        XCTAssertEqual(taskList.getItem(index: 0), "Makan")
    }
    
    func testUpdateTaskInSpecificIndexWillUpdateTheTaskInThatIndex(){
        let taskList = TaskListManager()
        let task = "Makan"
        taskList.add(task)
        XCTAssertEqual(taskList.getItem(index: 0), "Makan")
        taskList.update(index: 0,  taskItem: "Mandi")
        XCTAssertEqual(taskList.getItem(index: 0), "Mandi")
    }

    func testDeleteTaskWillDeleteItemInTaskList(){
        let taskList = TaskListManager()
        let task = "Makan"
        taskList.add(task)
        XCTAssertEqual(taskList.getItem(index: 0), "Makan")
        taskList.add("Mandi")
        XCTAssertEqual(taskList.getItem(index: 1), "Mandi")
        taskList.deleteItem(index: 1)
        XCTAssertEqual(taskList.taskCount(), 1)
        
    }
    
    func testDeleteAllTask() {
        let taskList = TaskListManager()
        taskList.add("Mandi")
        XCTAssertEqual(task[0], "Mandi")
        deleteAllTask()
        XCTAssertTrue(task.isEmpty)
        
    }
    

}
