//
//  Response.swift
//  JustoApp
//
//  Created by Emi Mtz on 06/06/22.
//

import UIKit

struct Response <T:Codable>: Codable
{
  var response: T?
  
  enum CodingKeys: String, CodingKey
  {
    case response
  }
}
