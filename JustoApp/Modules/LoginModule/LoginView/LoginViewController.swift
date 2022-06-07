//
//  LoginViewController.swift
//  JustoApp
//
//  Created Emi Mtz on 07/06/22.
//  Copyright © 2022  . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,LoginViewControllerProtocol {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var userTextField: UITextField!
  @IBOutlet weak var passwordTextfield: UITextField!
  @IBOutlet weak var loginBtn: UIButton!
  @IBOutlet weak var containerView: UIView!
  
  var presenter: LoginPresenterProtocol?
  var resultsGlobal: Results?
  
  override func viewDidLoad() {
    presenter?.getResults()
    setOutlets()
  }

  func showResults(results: Results?){
    DispatchQueue.main.async {
    guard let results: Results = results else {
      return
    }
      self.userTextField.placeholder = results.results.first?.login.username
      self.passwordTextfield.placeholder = results.results.first?.login.password
      self.userTextField.text = results.results.first?.login.username
      self.passwordTextfield.text = results.results.first?.login.password
      self.resultsGlobal = results
    }
  }

  func setOutlets() {
    setShadow()
    imageView.layer.cornerRadius = 25.0
    imageView.clipsToBounds = true
    loginBtn.layer.cornerRadius = 10.0
  }

  func setShadow() {
    containerView.layer.cornerRadius = 25.0
    containerView.layer.shadowColor = UIColor.darkGray.cgColor
    containerView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
    containerView.layer.shadowRadius = 25.0
    containerView.layer.shadowOpacity = 0.9
    loginBtn.layer.shadowColor = UIColor.darkGray.cgColor
    loginBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
    loginBtn.layer.shadowRadius = 25.0
    loginBtn.layer.shadowOpacity = 0.9
  }

  func continueLogin(result: Result) {
    let vc = ResultsRouter.createModule(results: result, delegate: self)
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  @IBAction func loginAction(_ sender: Any) {
    guard let results: Results = resultsGlobal else {
      return customAlert(title: "Error",
                         message: "Error en el servicio",
                         completion: nil)
    }
    var userCorrect: Bool = false
    results.results.forEach({
      if $0.login.username == self.userTextField.text {
        let passwordSha256: String = self.passwordTextfield.text?.sha256() ?? ""
        if $0.login.password.sha256() == passwordSha256 || $0.login.sha256 == passwordSha256 {
          self.continueLogin(result: $0)
          userCorrect = true
          return
        } else {
          self.customAlert(title: "Error", message: "Contraseña incorrecta", completion: nil)
          return
        }
      }
    })
    if !userCorrect {
      customAlert(title: "Error", message: "Usuario Incorrecto", completion: nil)
    }
  }
}

extension LoginViewController: LogOutDelegate {
  func logOut() {
    userTextField.text = ""
    passwordTextfield.text = ""
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      self.presenter?.getResults()
    }
  }
}
