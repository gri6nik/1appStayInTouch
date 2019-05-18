//
//  ViewIdentifier.swift
//  StayInTouch
//
//  Created by User on 5/18/19.
//  Copyright © 2019 FridrihCo. All rights reserved.
//

import UIKit

extension UIView {

    static var identifier: String {
        return String(describing: self)
    }
}
