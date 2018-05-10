//
//  JourneyPickerTVC.swift
//  Journey-PMA
//
//  Created by dominic on 5/9/18.
//  Copyright © 2018 Dominic Holmes. All rights reserved.
//

import UIKit

class JourneyPickerTVC : UITableViewController {
    
    var journies: [Journey] = [Journey]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        journies = Journey.getDefaultJournies()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journeyOptionCell")
        
        let titleLabel = cell?.viewWithTag(100) as! UILabel
        let subtitleLabel = cell?.viewWithTag(101) as! UILabel
        
        let journey = journies[indexPath.row]

        
        titleLabel.text = journey.title
        
        return cell!
    }

}
