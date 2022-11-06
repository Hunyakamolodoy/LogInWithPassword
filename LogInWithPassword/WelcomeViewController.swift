//
//  WelcomeViewController.swift
//  LogInWithPassword
//
//  Created by Дмитрий Селезнев on 06.11.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var welcomeLabel: UILabel!
    
    var usernameWelcome: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(usernameWelcome ?? "")"
    }
}
