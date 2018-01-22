//
//  StartViewController.swift
//  SideTwoGame
//
//  Created by Tanya Tomchuk on 05/09/2017.
//  Copyright © 2017 Tanya Tomchuk. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {

    var loginSuccess = false

    @IBAction func FBLoginButton(_ sender: UIButton) {
        if FBSDKAccessToken.current() != nil {
            self.loginSuccess = true
            self.viewDidAppear(true)
        } else {
            FBManager.shared.logIn(withReadPermissions: ["public_profile", "email"], from: self,
                                   handler: { (result, error) in
                if error == nil{
                    self.loginSuccess = true
                    self.viewDidAppear(true)
                }
            })
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        if (FBSDKAccessToken.current() != nil && loginSuccess == true) {
            performSegue(withIdentifier: "ClientView", sender: self)
        }
    }

}
