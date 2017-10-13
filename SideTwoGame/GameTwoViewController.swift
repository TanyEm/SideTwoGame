//
//  GameTwoViewController.swift
//  SideTwoGame
//
//  Created by Tanya Tomchuk on 05/09/2017.
//  Copyright © 2017 Tanya Tomchuk. All rights reserved.
//

import UIKit

class GameTwoViewController: UIViewController {

    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            menuBarButton.target = self.revealViewController()
            menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        loadGameTwo()
    }
    
    func loadGameTwo() {
        let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "game2/game")!
        let request = URLRequest(url: url)
        webView.loadRequest(request);
    }
    
    func webViewDidStatLoad(_ : UIWebView) {
        spinner.startAnimating()
        
        NSLog("The WebView is starting to load")
    }
    
    func webViewDidFinishLoad(_ : UIWebView) {
        spinner.stopAnimating()
        
        NSLog("The WebView is done loading")
    }

}
