//
//  EventManager.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-19.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class EventManager {
    let eventList: [Event]
    
    init() {
        do {
            let plistEventList = try PListConvertor.array(fromFile: "Events", ofType: "plist")
            eventList = try EventListBuilder.eventList(fromArray: plistEventList)
        } catch let error as ReaderError {
            fatalError("Failed to load events, \(error.rawValue)")
        } catch {
            fatalError("Unknown error, \(error.localizedDescription)")
        }
    }
    
    
}
