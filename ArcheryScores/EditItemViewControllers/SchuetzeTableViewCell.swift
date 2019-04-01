//
//  SchuetzeTableViewCell.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 14.01.19.
//  Copyright © 2019 Tobi Eder. All rights reserved.
//

import UIKit

class SchuetzeTableViewCell: UITableViewCell {

    @IBOutlet weak var schuetzeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
