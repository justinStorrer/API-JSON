//
//  CourseTableViewCell.swift
//  API & JSON
//
//  Created by Justin Storrer on 4/12/21.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var subtitleViewLabel: UILabel!
    @IBOutlet weak var titleViewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
