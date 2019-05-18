//
//  NewsTextTableViewCell.swift
//  StayInTouch
//
//  Created by User on 5/17/19.
//  Copyright © 2019 FridrihCo. All rights reserved.
//

import UIKit

class NewsTextTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak private var newsTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(newsText: String) {
        newsTextLabel.text = newsText
    }
}
