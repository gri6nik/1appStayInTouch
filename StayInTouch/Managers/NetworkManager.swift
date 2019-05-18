//
//  Feeds.swift
//  StayInTouch
//
//  Created by User on 5/9/19.
//  Copyright © 2019 FridrihCo. All rights reserved.
//

import Foundation

var articles: [Article] = []
var urlToData: URL {
let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true) [0]+"/data.json"
let urlPath = URL(fileURLWithPath: path)
    return urlPath
}

func loadNews(completionHandler: (() -> Void)?) {
    let url = URL(string: "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=499dbc134a424827ae07607640740bc7")
    let session = URLSession(configuration: .default)
    if let mainUrl = url {
        let downloadTask = session.downloadTask(with: mainUrl) { (urlFile, _, _) in
            if let mainUrlFile = urlFile {
                try? FileManager.default.copyItem(at: mainUrlFile, to: urlToData)
                parseNews()
                completionHandler?()
            }
        }
        downloadTask.resume()
    }
}

func parseNews () {
    let data = (try? Data(contentsOf: urlToData)) ?? Data()
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
    let rootDictionary = rootDictionaryAny as? [String:Any]

    if let array = rootDictionary?["articles"] as? [[String:Any]] {
        var returnArray: [Article] = []
        for dict in array {
            let newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
        }
        articles = returnArray
    }
}
