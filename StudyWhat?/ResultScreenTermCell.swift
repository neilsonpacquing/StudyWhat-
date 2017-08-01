//
//  ResultScreenTermCell.swift
//  StudyWhat?
//
//  Created by Neilson Pacquing on 7/26/17.
//  Copyright © 2017 Neilson Pacquing. All rights reserved.
//

import UIKit

class ResultScreenTermCell: UITableViewCell {

    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var termScore: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
