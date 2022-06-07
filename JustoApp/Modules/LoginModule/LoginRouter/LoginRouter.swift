//
//  LoginRouter.swift
//  JustoApp
//
//  Created Emi Mtz on 07/06/22.
//  Copyright © 2022  . All rights reserved.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    
    weak var presenter: LoginPresenterProtocol?
    
    static func createModule() -> UIViewController {
        let s = mainstoryboard
        let view = s.instantiateViewController(withIdentifier: "Login") as! LoginViewControllerProtocol
        var presenter: LoginPresenterProtocol & LoginInteractorOutputProtocol = LoginPresenter()
        var interactor:LoginInteractorProtocol = LoginInteractor()
        var router: LoginRouterProtocol = LoginRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        router.presenter = presenter
        interactor.output = presenter
        
        return view
    }
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "LoginStoryboard", bundle: nil)
    }
}
