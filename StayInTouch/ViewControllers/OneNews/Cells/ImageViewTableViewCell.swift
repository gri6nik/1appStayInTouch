//
//  ImageViewTableViewCell.swift
//  StayInTouch
//
//  Created by User on 5/17/19.
//  Copyright © 2019 FridrihCo. All rights reserved.
//

import UIKit

import SDWebImage

class ImageViewTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet private var newsImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(imageString: String) {
        let imageURL = URL(string: imageString)
        if imageString.contains("video") || imageString == "" {
            newsImageView.image = #imageLiteral(resourceName: "imagePlaceholder")
        } else {
            newsImageView.sd_setImage(with: imageURL, completed: nil)
        }
    }
}
