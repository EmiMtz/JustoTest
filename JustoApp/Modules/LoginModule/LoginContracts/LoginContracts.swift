//
//  LoginContracts.swift
//  JustoApp
//
//  Created Emi Mtz on 07/06/22.
//  Copyright © 2022  . All rights reserved.
//

import UIKit
//Views
protocol LoginViewControllerProtocol: UIViewController {
  var presenter: LoginPresenterProtocol? {get set}
  func showResults(results: Results?)
}
//Interactor
protocol LoginInteractorProtocol: NSObject {
  var output: LoginInteractorOutputProtocol? {get set}
  func getResults(completion: @escaping (NSError?,Results?) -> Void)
  
}

protocol LoginInteractorOutputProtocol: NSObject {
  
}

//Presenter
protocol LoginPresenterProtocol: NSObject {
  var view: LoginViewControllerProtocol? {get set}
  var interactor: LoginInteractorProtocol? {get set}
  var router: LoginRouterProtocol? {get set}

  func getResults()
}
//Router
protocol LoginRouterProtocol {
  var presenter: LoginPresenterProtocol? {get set}
  static func createModule() -> UIViewController
  
}

