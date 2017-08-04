//
//  SubjectTableViewCell.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/31/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {

    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var numberTopics: UILabel!
    //@IBOutlet weak var leftViewColor: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
