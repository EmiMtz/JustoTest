//
//  CustomLoader.swift
//  JustoApp
//
//  Created by Emi Mtz on 06/06/22.
//

import UIKit
import MaterialComponents.MaterialActivityIndicator

class CustomLoader: MDCActivityIndicator {
  
  let lblCounter = UILabel()
  
  func configLoader(){
    self.sizeToFit()
    self.radius = 30.0;
    self.strokeWidth = 4
    self.cycleColors = [UIColor.red]
    self.backgroundColor = UIColor(white: 1, alpha: 0.7)
  }
  
}
