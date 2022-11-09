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
    
    private let user = "b"
    private let password = "1234"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else {return}
        guard let viewControllers = tabBarVC.viewControllers else {return}
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                guard let describeVC = navigationVC.topViewController as? DescribeViewController else {return}
                describeVC.view.backgroundColor = .tertiarySystemGroupedBackground
            }
        }
    }
    
    @IBAction func userButtonAction() {
        showAlert(
            withTitile: "Упсс...",
            andMessage: "Ваш логин \(user)"
        )
    }
    
    @IBAction func passwordButtonAction() {
        showAlert(
            withTitile: "Упсс...",
            andMessage: "Ваш пароль \(password)"
        )
    }
    
    @IBAction func loginButtonAction() {
        guard userTF.text == user, passwordTF.text == password else {
            userTF.text = ""
            passwordTF.text = ""
            showAlert(
                withTitile: "Неверный логин или пароль",
                andMessage: "Пожалуйста, проверьте корректность введенных данных"
            )
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userTF.text = ""
        passwordTF.text = ""
    }
}


// MARK: - UIAlertController

extension LoginViewController {
    private func showAlert(withTitile title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
