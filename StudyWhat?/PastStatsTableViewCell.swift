//
//  PastStatsTableViewCell.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/29/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import UIKit

class PastStatsTableViewCell: UITableViewCell {

    @IBOutlet weak var termScore: UILabel!
    
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var leftViewColor: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
