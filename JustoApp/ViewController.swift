//
//  ViewController.swift
//  JustoApp
//
//  Created by Emi Mtz on 06/06/22.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    showResults()
  }
  
  func showResults(){
    DispatchQueue.main.async {
      let vc = LoginRouter.createModule()
      
      let nav = UINavigationController(rootViewController: vc)
      nav.modalPresentationStyle = .overCurrentContext
      nav.isNavigationBarHidden = true
      
      self.navigationController?.present(nav, animated: true, completion: nil)
    }
  }
}

