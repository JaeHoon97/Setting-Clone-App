//
//  GeneralTableViewCell.swift
//  Setting-Clone-App
//
//  Created by 재훈 on 1/19/24.
//

import UIKit

class GeneralTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainDesc: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
