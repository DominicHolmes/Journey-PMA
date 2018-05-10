//
//  Journey.swift
//  Journey-PMA
//
//  Created by dominic on 5/8/18.
//  Copyright © 2018 Dominic Holmes. All rights reserved.
//

import Foundation

//https://docs.google.com/spreadsheets/d/1Rr01zDIH9IpobpV62jgMbR9BOijKCyWPZrIMzJcr_0I/edit?usp=sharing

class Journey {
    
    let title: String
    let steps: [JourneyStep]
    let introContent: String
    
    init(called title: String, withSteps steps: [JourneyStep], withIntro intro: String) {
        self.title = title
        self.steps = steps
        self.introContent = intro
    }
    
    static func getDefaultJournies() -> [Journey] {
        var journies = [Journey]()
        
        let journeyTitle = "Philadelphia History"
        let journeySteps = [JourneyStep(ofType: .checkmark, withContent: "Begin"),
                        JourneyStep(ofType: .divider,   withContent: ""),
                        JourneyStep(ofType: .wayfinding, withContent: "Head to Gallery 201 on the 2nd floor."),
                        JourneyStep(ofType: .search, withContent: "Search for 'Starry Night'"),
                        JourneyStep(ofType: .image, withContent: "image/url"),
                        JourneyStep(ofType: .divider, withContent: ""),
                        JourneyStep(ofType: .checkmark, withContent: "End")]
        let introContent = "This is a write up describing the journey, etc. This is a write up describing the journey, etc. This is a write up describing the journey, etc. This is a write up describing the journey, etc."
        let newJourney = Journey(called: journeyTitle, withSteps: journeySteps, withIntro: introContent)
        
        for i in 0...6 {
            journies.append(newJourney)
        }
        
        return journies
    }
}

class JourneyStep {
    
    var stepType: JourneyStepType
    var content: String
    
    init(ofType type: JourneyStepType, withContent content: String) {
        self.stepType = type
        self.content = content
    }
}

enum JourneyStepType : String {
    case checkmark
    case divider
    case wayfinding
    case search
    case image
    
    var cellIdentifier : String {
        return self.rawValue + "CellIdentifier"
    }
}
