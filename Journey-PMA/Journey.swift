//
//  Journey.swift
//  Journey-PMA
//
//  Created by dominic on 5/8/18.
//  Copyright © 2018 Dominic Holmes. All rights reserved.
//

import Foundation

class Journey {
    
    let steps: [JourneyStep]
    
    init(withSteps steps: [JourneyStep]) {
        self.steps = steps
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

enum JourneyStepType {
    case begin
    case direction
    case image
    case search
}
