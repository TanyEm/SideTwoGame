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


    @IBOutlet weak var loginFB: UIButton!
    @IBOutlet weak var logoutFB: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if FBSDKAccessToken.current() != nil {
            logoutFB.isHidden = false
            FBManager.getGserData(competion: {
                self.loginFB.setTitle("Continue as \(String(describing: UserData.currentUser.email))", for: .normal)
            })
        }

    }

    @IBAction func FBLogoutButton(_ sender: UIButton){
        FBManager.shared.logOut()
        UserData.currentUser.resetUser()

        logoutFB.isHidden = true
        loginFB.setTitle("Login with Facebook", for: .normal)
    }


    @IBAction func FBLoginButton(_ sender: UIButton) {
        if FBSDKAccessToken.current() != nil {
            self.loginSuccess = true
            self.viewDidAppear(true)
        } else {
            FBManager.shared.logIn(withReadPermissions: ["public_profile", "email"], from: self,
                                   handler: { (result, error) in
                if error == nil{
                    FBManager.getGserData(competion: {
                        self.loginSuccess = true
                        self.viewDidAppear(true)
                    })
                }
            })
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        if (FBSDKAccessToken.current() != nil && loginSuccess == true) {
            performSegue(withIdentifier: "ClientView", sender: self)
        }
    }

}
