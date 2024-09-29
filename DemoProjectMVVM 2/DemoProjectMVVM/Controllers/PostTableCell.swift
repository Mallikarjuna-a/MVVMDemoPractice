//
//  PostTableCell.swift
//  DemoProjectMVVM
//
//  Created by Mallikarjuna A on 30/08/24.
//

import UIKit

class PostTableCell: UITableViewCell {

    @IBOutlet weak var postTitleLabel: UILabel!
    
    @IBOutlet weak var postDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
