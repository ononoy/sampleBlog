//
//  BlogListCell.swift
//  sampleBlog
//
//  Created by y on 2017/10/18.
//  Copyright © 2017年 onono. All rights reserved.
//

import UIKit

class BlogListCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
