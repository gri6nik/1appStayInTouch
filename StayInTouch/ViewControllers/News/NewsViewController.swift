//
//  NewsViewController.swift
//  StayInTouch
//
//  Created by User on 5/10/19.
//  Copyright © 2019 FridrihCo. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet private var newsTebleView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadNews {
            DispatchQueue.main.async {
                self.newsTebleView.reloadData()
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOneNews" {
            if let indexPath = newsTebleView.indexPathForSelectedRow { (segue.destination as? OneNewsViewController)?.article = articles[indexPath.row]
                newsTebleView.deselectRow( at: indexPath, animated: true)
            }
        }
    }
}

extension NewsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: NewsCellTableViewCell.identifier, for: indexPath) as? NewsCellTableViewCell
        newsCell?.configure(index: indexPath.row)
        return newsCell ?? UITableViewCell()
    }
}

extension NewsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToOneNews", sender: indexPath)
    }
}
