//
//  FBManager.swift
//  SideTwoGame
//
//  Created by Tanya Tomchuk on 20/01/2018.
//  Copyright © 2018 Tanya Tomchuk. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import SwiftyJSON

class FBManager {
    static let shared = FBSDKLoginManager()

    // Here we see what data about the user we get
    public class func getGserData (competion: @escaping () -> Void){
        if FBSDKAccessToken.current() != nil {
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "name, email, picture.type(normal)"]).start(completionHandler: { (connection, result, error) in
                if error == nil {
                    let json = JSON(result!)
                    print(json)
                    UserData.currentUser.setUser(json)
                    competion()
                }
            })
        }
    }
}
