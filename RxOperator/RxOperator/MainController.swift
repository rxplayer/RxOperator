//
//  ViewController.swift
//  RxOperator
//
//  Created by hy_sean on 22/02/2019.
//  Copyright © 2019 hy_sean. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainController: UITableViewController {
  
  let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = nil
    tableView.dataSource = nil
    
    let items = Observable.just([
      "First Item",
      "Second Item",
      "Third Item"
    ])
    
    items
      .bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { (row, element, cell) in
        cell.textLabel?.text = "\(element) @ row \(row)"
      }
      .disposed(by: disposeBag)
  }
}
