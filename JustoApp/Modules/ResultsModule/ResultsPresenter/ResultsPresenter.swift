//
//  ResultsPresenter.swift
//  JustoApp
//
//  Created Emi Mtz on 06/06/22.
//  Copyright © 2022 . All rights reserved.
//

import UIKit

class ResultsPresenter: NSObject, ResultsPresenterProtocol {
  
  weak var view: ResultsViewControllerProtocol?
  var interactor: ResultsInteractorProtocol?
  var router: ResultsRouterProtocol?
  
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
extension ResultsPresenter: ResultsInteractorOutputProtocol {
  
}
