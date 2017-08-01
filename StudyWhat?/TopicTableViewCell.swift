//
//  TopicTableViewCell.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/31/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import UIKit

class TopicTableViewCell: UITableViewCell {

    @IBOutlet weak var leftViewColor: UIView!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var numberOfTerms: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
