//
//  OneNewsViewController.swift
//  StayInTouch
//
//  Created by User on 5/17/19.
//  Copyright © 2019 FridrihCo. All rights reserved.
//

import UIKit

class OneNewsViewController: UIViewController {

    var article: Article?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OneNewsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let imageCell = tableView.dequeueReusableCell(withIdentifier: ImageViewTableViewCell.identifier, for: indexPath) as? ImageViewTableViewCell
            imageCell?.configure(imageString: article?.urlToImage ?? "")
            return imageCell ?? UITableViewCell()
        } else if indexPath.row == 1 {
            let imageCell = tableView.dequeueReusableCell(withIdentifier: NewsTitleTableViewCell.identifier, for: indexPath) as? NewsTitleTableViewCell
            imageCell?.configure(newsTitle: article?.title ?? "")
            return imageCell ?? UITableViewCell()
        } else if indexPath.row == 2 {
            let imageCell = tableView.dequeueReusableCell(withIdentifier: NewsTextTableViewCell.identifier, for: indexPath) as? NewsTextTableViewCell
            imageCell?.configure(newsText: article?.content ?? "")
            return imageCell ?? UITableViewCell()
        }
        return UITableViewCell()
    }
}

extension OneNewsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200.0
        } else if indexPath.row == 1 {
            return UITableView.automaticDimension
        } else if indexPath.row == 2 {
            return UITableView.automaticDimension
        }
        return 0.0
    }
}
