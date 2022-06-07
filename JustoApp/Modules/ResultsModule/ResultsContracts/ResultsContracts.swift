//
//  ResultsContracts.swift
//  JustoApp
//
//  Created Emi Mtz on 06/06/22.
//  Copyright © 2022 . All rights reserved.
//

import UIKit
//Views
protocol ResultsViewControllerProtocol: UIViewController {
  var presenter: ResultsPresenterProtocol? {get set}
  var result: Result? {get set}
  var delegate: LogOutDelegate? {get set}
  func showResults(results: Results?)
}
//Interactor
protocol ResultsInteractorProtocol: NSObject {
  var output: ResultsInteractorOutputProtocol? {get set}
  func getResults(completion: @escaping (NSError?,Results?) -> Void)
}

protocol ResultsInteractorOutputProtocol: NSObject {
  
}

//Presenter
protocol ResultsPresenterProtocol: NSObject {
  var view: ResultsViewControllerProtocol? {get set}
  var interactor: ResultsInteractorProtocol? {get set}
  var router: ResultsRouterProtocol? {get set}

  func getResults()
}
//Router
protocol ResultsRouterProtocol {
  var presenter: ResultsPresenterProtocol? {get set}
  static func createModule(results: Result, delegate: LogOutDelegate?) -> UIViewController
  
}

