//
//  UserData.swift
//  SideTwoGame
//
//  Created by Tanya Tomchuk on 22/01/2018.
//  Copyright © 2018 Tanya Tomchuk. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserData {
    var name: String?
    var email: String?
    var pictureURL: String?

    static let currentUser = UserData()

    func setUser(_ json: JSON) {
        self.name = json["name"].string
        self.email = json["email"].string

        let image = json["picture"].dictionary
        let imageData = image?["data"]?.dictionary
        self.pictureURL = imageData?["url"]?.string
    }

    func resetUser() {
        self.name = nil
        self.email = nil
        self.pictureURL = nil
    }
}


