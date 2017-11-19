//
//  Event.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-14.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

protocol Events {
    var eventDescription: String { get }
    var eventYear: Int { get }
    var eventMonth: Int { get }
}

struct Event: Events, Equatable {
    let eventDescription: String
    let eventYear: Int
    let eventMonth: Int
    
    static func ==(lhs: Event, rhs: Event) -> Bool {
        return lhs.eventDescription == rhs.eventDescription && lhs.eventMonth == rhs.eventMonth && lhs.eventYear == rhs.eventYear
    }
}
