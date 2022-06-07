//
//  Enums.swift
//  JustoApp
//
//  Created by Emi Mtz on 06/06/22.
//

import Foundation

public enum CodeResponse: Int {
  case ok = 200
  case bad_request = 400
  case authentication_failed = 401
  case not_found = 404
  case server_error = 500
  case unknow = 520
  case not_connection = 106
  case bad_url = -1
  case bad_decodable = -2
}

enum Environment: String{
  case QA = "development"
  case Productivo = "production"
}
