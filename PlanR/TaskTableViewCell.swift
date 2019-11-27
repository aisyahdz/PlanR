//
//  TaskTableViewCell.swift
//  PlanR
//
//  Created by Aisyah Dzulqaidah on 09/08/19.
//  Copyright © 2019 Aisyah Dzulqaidah. All rights reserved.
//

import UIKit
import EventKit

protocol TaskViewCellDelegate: class {
    func reloadData()
}

class TaskTableViewCell: UITableViewCell{
    var calendarEvent = CalendarEvent()
    
    var task: String? {
        didSet{
            taskView.text = task
            taskView.becomeFirstResponder()
        }
    }
    @IBAction func addToCalendar(_ sender: UIButton) {
        let eventStore = EKEventStore()        
        if (EKEventStore.authorizationStatus(for: .event) != .authorized) {
            eventStore.requestAccess(to: .event, completion:  { _,_ in
                self.insertEvent(name: "Event1", to: "PlanR", store: eventStore)
            })
        } else {
            self.insertEvent(name: "Event2", to: "PlanR", store: eventStore)
        }
    }
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var taskView: UITextView!
    @IBOutlet weak var taskViewHeightConstraint: NSLayoutConstraint!
    weak var delegate: TaskViewCellDelegate?
    
    @IBAction func saveEvent(_ sender: Any) {
        calendarEvent.insertEvent(name: taskView.text, to: "PlanR")
        delegate?.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        taskView.delegate = self
        taskView.isScrollEnabled = false
    }
    
    func newCalendar(name: String, store: EKEventStore) throws -> EKCalendar {
        let newCalendar = EKCalendar(for: .event, eventStore: store)
        let sourcesInEventStore = store.sources
        newCalendar.source = sourcesInEventStore.filter { (source: EKSource) -> Bool in
            source.sourceType == .local }.first!
        newCalendar.title = name
        try store.saveCalendar(newCalendar, commit: true)
        return newCalendar
    }
    
    func getCalendar(name: String, store: EKEventStore) -> EKCalendar? {
        let calendars = store.calendars(for: .event)
        return calendars.filter{ $0.title == name}.first
    }
    
    func getOrCreateCalendar(name: String, store: EKEventStore) throws -> EKCalendar {
        if let calendar = getCalendar(name: name, store: store) {
            return calendar
        } else {
            return try newCalendar(name: name, store: store)
        }
    }
    
    private func insertEvent(name: String, to calendarName: String, store: EKEventStore) {
        let startDate = Date()
        let endDate = startDate.addingTimeInterval(2 * 60 * 60)
        
        let event = EKEvent(eventStore: store)
        event.calendar = try? getOrCreateCalendar(name: calendarName, store: store)
        event.title = name
        event.startDate = startDate
        event.endDate = endDate
        do {
            try store.save(event, span: .thisEvent)
            dateText.text = "Saved to PlanR Calendar"
        }
        catch {
            print("Error saving event in calendar")
            
        }
    }
    
    

}

extension TaskTableViewCell : UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
//        taskList.update(index: textView.tag, taskItem: TaskItem(task: textView.text, dueDate: Date()))
//        delegate?.reloadData()
//        taskView.reloadInputViews()
    }
    
    
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isContainingToday() {
            dateText.text = "Hari ini"
        } else {
            dateText.text = ""
        }
    }
    
}

