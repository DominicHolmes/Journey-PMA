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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var introTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let journeyTitle = "Philadelphia History"
        journeySteps = [JourneyStep(ofType: .checkmark, withContent: "Begin"),
                        JourneyStep(ofType: .divider,   withContent: ""),
                        JourneyStep(ofType: .wayfinding, withContent: "Head to Gallery 201 on the 2nd floor."),
                        JourneyStep(ofType: .search, withContent: "Search for 'Starry Night'"),
                        JourneyStep(ofType: .image, withContent: "image/url"),
                        JourneyStep(ofType: .divider, withContent: ""),
                        JourneyStep(ofType: .checkmark, withContent: "End")]
        let introContent = "This is a write up describing the journey, etc. This is a write up describing the journey, etc. This is a write up describing the journey, etc. This is a write up describing the journey, etc."
        journey = Journey(called: journeyTitle, withSteps: journeySteps!, withIntro: introContent)
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journeySteps?.count ?? 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch journeySteps![indexPath.row].stepType {
        case .checkmark:
            return 50.0
        case .wayfinding:
            return 80.0
        case .search:
            return 50.0
        case .image:
            return 120.0
        // load image from url
        case .divider:
            return 40.0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let journeyStep = journeySteps![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: journeyStep.stepType.cellIdentifier)
        print(journeyStep.stepType.cellIdentifier)
        
        switch journeyStep.stepType {
        case .checkmark:
            let contentLabel = cell?.viewWithTag(100) as! UILabel
            contentLabel.text = journeyStep.content
        case .wayfinding:
            let contentView = cell?.viewWithTag(100) as! UILabel
            contentView.text = journeyStep.content
        case .search:
            let contentView = cell?.viewWithTag(100) as! UILabel
            contentView.text = journeyStep.content
        case .image:
            let _ = cell?.viewWithTag(100) as! UIImageView
            // load image from url
        case .divider:
            print("Divider")
            // do nothing
        }
        
        return cell!
    }
}
