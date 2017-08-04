//
//  ConfidenceSubjectTableViewCell.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 8/4/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import UIKit

class ConfidenceSubjectTableViewCell: UITableViewCell {

    @IBOutlet weak var confidenceSubject: UILabel!
    @IBOutlet weak var numberTopics: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
