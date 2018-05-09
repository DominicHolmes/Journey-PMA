//
//  JourneyViewController.swift
//  Journey-PMA
//
//  Created by dominic on 5/8/18.
//  Copyright © 2018 Dominic Holmes. All rights reserved.
//

import UIKit

class JourneyTVC : UITableViewController {
    
    var journeySteps : [JourneyStep]?
    var journey : Journey?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        journeySteps = [JourneyStep(ofType: .checkmark, withContent: "Begin")]
        journey = Journey(withSteps: journeySteps!)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journeySteps.count ?? 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let journeyStep = journeySteps![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(journeyStep.stepType)CellIdentifier")
    }
}
