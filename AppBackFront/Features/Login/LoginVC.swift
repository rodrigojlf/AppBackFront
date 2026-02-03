//
//  ViewController.swift
//  AppBackFront
//
//  Created by Rodrigo Lima on 28/08/23.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    var auth: Auth?
    var loginScreen: LoginScreen?
    var alert: AlertController?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
        alert = AlertController(controller: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyBoard()
        auth = Auth.auth()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
        loginScreen?.emailTextField.text = "teste@email.com"
        loginScreen?.passwordTextField.text = "123456"
        isEnabledLoginButton(false)
        
    }
    
    func validateTextField() {
        if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) && (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
            isEnabledLoginButton(true)
        } else {
            isEnabledLoginButton(false)
        }
    }
    
    func isEnabledLoginButton (_ isEnabled: Bool) {
        if isEnabled {
            loginScreen?.loginButton.setTitleColor(.white, for: .normal)
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.loginButtonImageView.alpha = 1
        } else {
            loginScreen?.loginButton.setTitleColor(.lightGray, for: .normal)
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.loginButtonImageView.alpha = 0.4
        }
    }


}

extension LoginVC: LoginScreenProtocol {
    func tappedLoginButton() {
        auth?.signIn(withEmail: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "", completion: { user, error in
            if error != nil {
                print("erro no login: \(error?.localizedDescription ?? "")")
                self.alert?.getAlert(title: "Falha no Login", message: error?.localizedDescription ?? "", completion: {
                    print("erro")
                    //esse completion pode ser omitido. Serve para executar uma ação ao pressionar o OK.
                })
            } else {
                print("sucesso no login")
                let vc = TabBarVC()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        })
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? false {
//            textField.layer.borderWidth = 1.5
//            textField.layer.borderColor = UIColor.systemRed.cgColor
        } else {
            switch textField {
            case self.loginScreen?.emailTextField:
                if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) {
                    loginScreen?.emailTextField.layer.borderWidth = 1
                    loginScreen?.emailTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    loginScreen?.emailTextField.layer.borderWidth = 1.5
                    loginScreen?.emailTextField.layer.borderColor = UIColor.systemRed.cgColor
                }
            case self.loginScreen?.passwordTextField:
                if (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
                    loginScreen?.passwordTextField.layer.borderWidth = 1
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    loginScreen?.passwordTextField.layer.borderWidth = 1.5
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.systemRed.cgColor
                }
            default:
                break
            }
        }
        validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

