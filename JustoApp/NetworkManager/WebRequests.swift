//
//  WebRequests.swift
//  JustoApp
//
//  Created by Emi Mtz on 06/06/22.
//

import Foundation
import UIKit

class WebRequests: NSObject {
  
  static var baseURL:String {
    get{
      
      let isProductivo = Constants.enviroment == .Productivo
      return isProductivo ? productivo : qa
    }
  }

  static let productivo =  "https://randomuser.me/api/" //Productivo
  
  static let qa = "https://randomuser.me/api/" //Development
  
  //Enum de los servicios web
  public enum ServiciosWeb: String
  {
    case WSExample = ""
  }
  
  /// Función que nos permite obtener URL de nuestro servicio
  ///
  /// - Parameter method: obtiene los servicios disponibles
  /// - Returns: devuelve nuestra URL en un string
  static func getURL() -> String?
  {
    var requestURL: String
    
    requestURL = baseURL
    print("URL COMPLETA: \(requestURL)")
    return requestURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    
  }
}

