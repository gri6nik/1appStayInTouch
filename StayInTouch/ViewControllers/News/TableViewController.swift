//
//  TableViewController.swift
//  StayInTouch
//
//  Created by User on 5/10/19.
//  Copyright © 2019 FridrihCo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadNews {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
        let article = articles[indexPath.row]
        newsCell.textLabel?.text = article.title
        newsCell.detailTextLabel?.text = article.publishedAt
//        let now = Date()
//        let RFC3339DateFormatter = DateFormatter()
//        RFC3339DateFormatter.locale = Locale(identifier: "ru_RU")
//        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
//        publishedAt.text = RFC3339DateFormatter.string(from: now)
        return newsCell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToOneNews", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOneNews" {
            if let indexPath = tableView.indexPathForSelectedRow { (segue.destination as? OneNewsViewController)?.article = articles[indexPath.row]
                tableView.deselectRow( at: indexPath, animated: true)
            }
        }
    }
}

extension T
