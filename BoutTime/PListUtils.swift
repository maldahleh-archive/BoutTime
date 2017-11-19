//
//  PListUtils.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-19.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

enum ReaderError: String, Error {
    case invalidResource = "Invalid Resource"
    case conversionFailure = "Conversion Failure"
}

class PListConvertor {
    static func array(fromFile name: String, ofType type: String) throws -> [[String: AnyObject]] {
        guard let path = Bundle.main.path(forResource: name, ofType: type) else {
            throw ReaderError.invalidResource
        }
        
        guard let array = NSArray(contentsOfFile: path) as? [[String: AnyObject]] else {
            throw ReaderError.conversionFailure
        }
        
        return array
    }
}

class EventListBuilder {
    static func eventList(fromArray array: [[String: AnyObject]]) throws -> [Event] {
        var events: [Event] = []
        
        for event in array {
            if let eventName = event["event"] as? String, let eventYear = event["year"] as? Int, let eventUrl = event["url"] as? String {
                let createdEvent = Event(eventDescription: eventName, eventYear: eventYear, eventURL: eventUrl)
                events.append(createdEvent)
            }
        }
        
        return events
    }
}
