//
//  BaseController.swift
//  RxOperator
//
//  Created by hy_sean on 23/02/2019.
//  Copyright © 2019 hy_sean. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
  
  var navTitle: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = navTitle
    view.backgroundColor = .white
  }
}
