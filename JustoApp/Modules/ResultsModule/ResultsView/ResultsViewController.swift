//
//  ResultsViewController.swift
//  JustoApp
//
//  Created Emi Mtz on 06/06/22.
//  Copyright © 2022 . All rights reserved.
//

import UIKit
import SDWebImage

protocol LogOutDelegate {
  func logOut()
}

class ResultsViewController: UIViewController,ResultsViewControllerProtocol {
  
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var logOutButton: UIButton!
  
  var presenter: ResultsPresenterProtocol?
  var result: Result?
  var infoUser: [InfoEntity]?
  var delegate: LogOutDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setDelegates()
    registerCell()
    setStyles()
    tableView.reloadData()
  }

  func setStyles() {
    infoUser = result?.getModel()
    image.layer.cornerRadius = 8.0
    image.clipsToBounds = true
    guard let imgURL: URL = URL(string: result?.picture.large ?? "") else { return }
    self.image.sd_setImage(with: imgURL, completed: nil)
    setShadow()
    image.layer.cornerRadius = 25.0
    image.clipsToBounds = true
  }

  func setShadow() {
    containerView.layer.cornerRadius = 25.0
    containerView.layer.shadowColor = UIColor.darkGray.cgColor
    containerView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
    containerView.layer.shadowRadius = 25.0
    containerView.layer.shadowOpacity = 0.9
    logOutButton.layer.cornerRadius = 10.0
    logOutButton.layer.shadowColor = UIColor.darkGray.cgColor
    logOutButton.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
    logOutButton.layer.shadowRadius = 25.0
    logOutButton.layer.shadowOpacity = 0.9
  }

  func registerCell(){
    let nib: UINib = UINib(nibName: "InfoCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: "InfoCell")
  }

  func setDelegates(){
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  func showResults(results: Results?){
    guard let results: Results = results else {
      return
    }
    print(results.results)
  }

  @IBAction func logOut(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
    self.delegate?.logOut()
  }
}

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let count: Int = infoUser?.count ?? .zero
    return count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as? InfoCell,
          let info: InfoEntity = infoUser?[indexPath.row] else { return UITableViewCell() }
    cell.info = info
    return cell
  }
}


