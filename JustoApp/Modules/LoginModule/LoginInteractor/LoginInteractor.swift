//
//  LoginInteractor.swift
//  JustoApp
//
//  Created Emi Mtz on 07/06/22.
//  Copyright © 2022  . All rights reserved.
//

import UIKit

class LoginInteractor: NSObject, LoginInteractorProtocol {
  
  weak var output: LoginInteractorOutputProtocol?
  
  func getResults(completion: @escaping (NSError?,Results?) -> Void){
    let urlService: String = WebRequests.getURL()!
    NetworkManager.shared.makeGetRequest(url: urlService) { (response: Results?, codeResponse: CodeResponse?) in
      var errorWS : NSError? = nil
      var results : Results? = nil
      
      switch codeResponse{
      case .ok:
        results = response
      case .not_found:
        errorWS = Constants.notFoundError
      case .not_connection:
        errorWS = Constants.connectivityError
      case .authentication_failed:
        errorWS = Constants.authFailedError
      default:
        errorWS = NSError(domain:"Error",
                          code:codeResponse?.rawValue ?? -1,
                          userInfo: ["message": "Error"])
      }
      
      completion(errorWS, results)
    }
  }
}
