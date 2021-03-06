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
    
    var doneButton : UIButton?
    
    var buttonPosition = 0
    var maxButtonPosition = 0
    
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
        maxButtonPosition = journeySteps!.count - 1
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addButton()
    }
    
    func addButton() {
        let targetCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        let x = targetCell!.frame.maxX - 52
        let y = targetCell!.frame.midY - 15
        let button = UIButton(frame: CGRect(x: x, y: y, width: 45, height: 27))
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor(red: 0.0, green: 184.0 / 255.0, blue: 217.0 / 255.0, alpha: 1.0), for: .normal)
        button.tintColor = .blue
        
        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        self.view.addSubview(button)
        
        doneButton = button
    }
    
    @objc func doneButtonTapped() {
        
        if buttonPosition < maxButtonPosition {
            buttonPosition += 1
            
            if let cell = tableView.cellForRow(at: IndexPath(row: buttonPosition, section: 0)) {
                UIView.animate(withDuration: 0.2) {
                    let currentFrame = self.doneButton!.frame
                    self.doneButton!.frame = CGRect(x: currentFrame.minX, y: cell.frame.midY - 15,
                                                    width: currentFrame.width, height: currentFrame.height)
                }
            }
        }
        
        
        print("Button press")
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
