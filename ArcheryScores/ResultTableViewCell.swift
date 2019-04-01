//
//  ResultTableViewCell.swift
//  ArcheryScores
//
//  Created by Tobi Eder on 11.12.18.
//  Copyright © 2018 Tobi Eder. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
