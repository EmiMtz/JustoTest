//
//  UIVIewControllerExtension.swift
//  JustoApp
//
//  Created by Emi Mtz on 06/06/22.
//

import Foundation
import UIKit

extension UIViewController {
  func customAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)?)  {
    let alert = UIAlertController(title: title, message: message,preferredStyle: .alert)
    let action = UIAlertAction(title: "Accept", style: .default, handler: completion)
    alert.addAction(action)
    self.present(alert, animated: true, completion: nil)
  }
  
  func showIndicator(){
    DispatchQueue.main.async {
      //Prevents double loader
      if (self.view.subviews.last as? CustomLoader) == nil{
        let activityIndicator = CustomLoader()
        activityIndicator.configLoader()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
      }
    }
  }
  
  func hideIndicator()
  {
    DispatchQueue.main.async {
      var vc = self
      if  let activityIndicator = vc.view.subviews.last as? CustomLoader{
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
      } else {
        vc = UIApplication.shared.keyWindow!.rootViewController!
        if  let activityIndicator = vc.view.subviews.last as? CustomLoader{
          activityIndicator.stopAnimating()
          activityIndicator.removeFromSuperview()
        }
      }
    }
  }
  
}
