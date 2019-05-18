//
//  DateFormatter.swift
//  StayInTouch
//
//  Created by User on 5/18/19.
//  Copyright © 2019 FridrihCo. All rights reserved.
//

import Foundation

extension String {

    var dateFormatter: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        if let dateFromString = dateFormatter.date(from: self) {
            var formattedData = ""
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            dateFormatter.timeZone = .current
            formattedData = dateFormatter.string(from: dateFromString)
            return formattedData
        }
        return ""
    }
}
