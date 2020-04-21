//
//  CardListTableViewCell.swift
//  CardList
//
//  Created by PCQ184 on 21/04/20.
//  Copyright © 2020 PCQ184. All rights reserved.
//

import UIKit

class CardListTableViewCell: UITableViewCell {
    @IBOutlet weak var listImage: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
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
