//
//  InfoCell.swift
//  JustoApp
//
//  Created by Emi Mtz on 07/06/22.
//

import Foundation
import UIKit

class InfoCell: UITableViewCell {

  @IBOutlet weak var infoName: UILabel!
  @IBOutlet weak var infoService: UILabel!

  var info: InfoEntity? {
    didSet {
      updateCell()
    }
  }

  func updateCell(){
    guard let info: InfoEntity = info else {
      return
    }
    infoName.text = info.infoName
    infoService.text = info.infoService
  }
}
