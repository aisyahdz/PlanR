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
        let task = TaskItem(task: "Makan", dueDate: Date())
        taskList.add(task)
        XCTAssertEqual(taskList.getItem(index: 0), task)
    }
    
    func testUpdateTaskInSpecificIndexWillUpdateTheTaskInThatIndex(){
        let taskList = TaskListManager()
        let task = TaskItem(task: "Makan", dueDate: Date())
        taskList.add(task)
        XCTAssertEqual(taskList.getItem(index: 0), task)
        let task2 = TaskItem(task: "Mandi", dueDate: Date())
        taskList.update(index: 0,  taskItem: task2)
        XCTAssertEqual(taskList.getItem(index: 0), task2)
    }

    func testDeleteTaskWillDeleteItemInTaskList(){
        let taskList = TaskListManager()
        let task = TaskItem(task: "Makan", dueDate: Date())
        taskList.add(task)
        XCTAssertEqual(taskList.getItem(index: 0), task)
        let task2 = TaskItem(task: "Mandi", dueDate: Date())
        taskList.add(task2)
        XCTAssertEqual(taskList.getItem(index: 1),task2)
        taskList.deleteItem(index: 1)
        XCTAssertEqual(taskList.count, 1)

    }

    func testDeleteAllTask() {
        let taskList = TaskListManager()
        let task = TaskItem(task: "Mandi", dueDate: Date())
        taskList.add(task)
        XCTAssertEqual(taskList.getItem(index: 0), task)
        deleteAllTask()
        XCTAssertTrue(taskList.isEmpty())

    }
    

}
