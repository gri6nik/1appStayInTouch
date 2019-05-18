//
//  NewsTitleTableViewCell.swift
//  StayInTouch
//
//  Created by User on 5/17/19.
//  Copyright © 2019 FridrihCo. All rights reserved.
//

import UIKit

class NewsTitleTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet private var newsTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(newsTitle: String) {
        newsTitleLabel.text = newsTitle
    }
}
