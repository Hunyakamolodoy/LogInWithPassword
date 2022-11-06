//
//  ViewController.swift
//  LogInWithPassword
//
//  Created by Дмитрий Селезнев on 04.11.2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var userTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    let user = "user"
    let password = "qwerty"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newTF = segue.destination as? WelcomeViewController else {return}
        newTF.usernameWelcome = userTF.text
    }
    
    @IBAction func userButtonAction() {
        showAlert(
            withTitile: "Oops!",
            andMessage: "Your name is \(user)"
        )
    }
    
    @IBAction func passwordButtonAction() {
        showAlert(
            withTitile: "Oops!",
            andMessage: "Your password is \(password)"
        )
    }
    
    @IBAction func loginButtonAction() {
        if userTF.text == user && passwordTF.text == password {
            //check = true
        } else {
            showAlert(
                withTitile: "Invalid login or password",
                andMessage: "Please, enter correct login and password"
            )
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else {return}
        userTF.text = ""
        passwordTF.text = ""
    }
}


// MARK: - UIAlertController

extension LoginViewController {
    private func showAlert(withTitile title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
