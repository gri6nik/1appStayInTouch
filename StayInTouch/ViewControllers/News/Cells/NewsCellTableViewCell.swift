//
//  NewsCellTableViewCell.swift
//  StayInTouch
//
//  Created by User on 5/18/19.
//  Copyright © 2019 FridrihCo. All rights reserved.
//

import UIKit

import SDWebImage

class NewsCellTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak private var newsNameLabel: UILabel!
    @IBOutlet weak private var newsDateLabel: UILabel!
    @IBOutlet weak private var newsImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(index: Int) {
        newsNameLabel.text = articles[index].title
        newsDateLabel.text = articles[index].publishedAt.dateFormatter
        let imageString = articles[index].urlToImage
        let imageURL = URL(string: imageString)
        if imageString.contains("video") || imageString == "" || imageString.contains("s.marketwatch.com") {
            newsImage.image = #imageLiteral(resourceName: "imagePlaceholder")
        } else {
            newsImage.sd_setImage(with: imageURL, completed: nil)
        }
    }
}
