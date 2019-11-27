//
//  CalendarManager.swift
//  PlanR
//
//  Created by Aisyah Dzulqaidah on 09/10/19.
//  Copyright © 2019 Aisyah Dzulqaidah. All rights reserved.
//

import Foundation
import EventKit

class CalendarEvent {
    private let eventStore : EKEventStore
    var eventTitle: [String] = []
    var startDates : [Date] = []
    var endDates : [Date] = []
    
    init(eventStore: EKEventStore = EKEventStore()) {
        self.eventStore = eventStore
    }
    
    func getAllEvents(from calendarName: String){
        let calendars = eventStore.calendars(for: .event)
        eventTitle.removeAll()
        startDates.removeAll()
        endDates.removeAll()
        for calendar in calendars {
            if calendar.title == calendarName {
                
                let oneMonthAgo = Date(timeIntervalSinceNow: -30*24*3600)
                let oneMonthAfter = Date(timeIntervalSinceNow: +30*24*3600)
                
                let predicate = eventStore.predicateForEvents(withStart: oneMonthAgo , end: oneMonthAfter, calendars: [calendar])
                
                let events = eventStore.events(matching: predicate)
                
                for event in events {
                    eventTitle.append(event.title)
                    startDates.append(event.startDate)
                    endDates.append(event.endDate)
                }
            }
        }
    }
    
    func addToCalendar() {
        if (EKEventStore.authorizationStatus(for: .event) != .authorized) {
            eventStore.requestAccess(to: .event, completion:  { _,_ in
                self.insertEvent(name: "Event1", to: "PlanR")
            })
        } else {
            self.insertEvent(name: "Event2", to: "PlanR")
        }
    }

    func insertEvent(name: String, to calendarName: String) {
        let startDate = Date()
        let endDate = startDate.addingTimeInterval(2 * 60 * 60)

        let event = EKEvent(eventStore: eventStore)
        event.calendar = try? getOrCreateCalendar(name: calendarName, store: eventStore)
        event.title = name
        event.startDate = startDate
        event.endDate = endDate
        do {
            try eventStore.save(event, span: .thisEvent)
        }
        catch {
            print("Error saving event in calendar")

        }
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
}







