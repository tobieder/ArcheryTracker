//
//  AuflageTableViewCell.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 29.12.18.
//  Copyright © 2018 Tobi Eder. All rights reserved.
//

import UIKit

class AuflageTableViewCell: UITableViewCell {

    @IBOutlet weak var auflageImage: UIImageView!
    @IBOutlet weak var auflageNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
