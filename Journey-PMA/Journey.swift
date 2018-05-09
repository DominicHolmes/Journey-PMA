//
//  Journey.swift
//  Journey-PMA
//
//  Created by dominic on 5/8/18.
//  Copyright © 2018 Dominic Holmes. All rights reserved.
//

import Foundation

class Journey {
    
    let title: String
    let steps: [JourneyStep]
    let introContent: String
    
    init(called title: String, withSteps steps: [JourneyStep], withIntro intro: String) {
        self.title = title
        self.steps = steps
        self.introContent = intro
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
