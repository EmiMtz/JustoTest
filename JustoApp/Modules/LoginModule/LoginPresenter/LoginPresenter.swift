//
//  LoginPresenter.swift
//  JustoApp
//
//  Created Emi Mtz on 07/06/22.
//  Copyright © 2022  . All rights reserved.
//

import UIKit

class LoginPresenter: NSObject, LoginPresenterProtocol {
  
  weak var view: LoginViewControllerProtocol?
  var interactor: LoginInteractorProtocol?
  var router: LoginRouterProtocol?
  
  func getResults(){
    view?.showIndicator()
    interactor?.getResults(completion: { (error, results) in
      self.view?.hideIndicator()
      if error == nil {
        self.view?.showResults(results: results ?? Results())
      } else {
        self.view?.customAlert(title: "Error", message: (error?.userInfo["message"] as! String), completion: nil)
      }
    })
  }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
  
}
