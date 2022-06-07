//
//  ResultsRouter.swift
//  JustoApp
//
//  Created Emi Mtz on 06/06/22.
//  Copyright © 2022 . All rights reserved.
//

import UIKit

class ResultsRouter: ResultsRouterProtocol {
  
  weak var presenter: ResultsPresenterProtocol?
  
  static func createModule(results: Result) -> UIViewController {
    let s = mainstoryboard
    let view = s.instantiateViewController(withIdentifier: "Results") as! ResultsViewControllerProtocol
    let presenter: ResultsPresenterProtocol & ResultsInteractorOutputProtocol = ResultsPresenter()
    let interactor:ResultsInteractorProtocol = ResultsInteractor()
    var router: ResultsRouterProtocol = ResultsRouter()
    
    view.presenter = presenter
    view.result = results
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    router.presenter = presenter
    interactor.output = presenter
    
    return view
  }
  static var mainstoryboard: UIStoryboard {
    return UIStoryboard(name: "ResultsStoryboard", bundle: nil)
  }
}
