//
//  Content.swift
//  StayInTouch
//
//  Created by User on 5/9/19.
//  Copyright © 2019 FridrihCo. All rights reserved.
//

import Foundation

/* The example of content
https://newsapi.org/v2/everything?q=bitcoin&from=2019-04-10&sortBy=publishedAt&apiKey=499dbc134a424827ae07607640740bc7
 */

struct Article {
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String
    var sourceName: String

    init(dictionary: [String:Any]) {
        author = dictionary["author"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        content = dictionary["content"] as? String ?? ""
        sourceName = (dictionary["source"] as? [String:Any] ?? ["":""])["name"] as? String ?? ""
    }
}
