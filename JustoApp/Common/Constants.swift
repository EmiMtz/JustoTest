//
//  Constants.swift
//  JustoApp
//
//  Created by Emi Mtz on 06/06/22.
//

import Foundation

class Constants {
  
  static var version: String = "0.0.0.1" //VERSIÓN DE LA APP
  static var enviroment: Environment = .Productivo //.QA ó .Productivo
  static func createTokenHeader() -> [String: String]{
    return  ["Authorization":""]
  }
  static let connectivityError: NSError = NSError(domain: "Connection error", code: CodeResponse.not_connection.rawValue, userInfo: ["message": "Connection error"])
  static let notFoundError: NSError = NSError(domain: "Not Found", code: CodeResponse.not_found.rawValue, userInfo: ["message": "Not Found"])
  static let authFailedError: NSError = NSError(domain: "Auth Failed", code: CodeResponse.authentication_failed.rawValue, userInfo: ["message": "Auth Failed"])
}
