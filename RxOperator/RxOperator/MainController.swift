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

class MainController: UIViewController {
  
  @IBOutlet var tableView: UITableView!
  
  let disposeBag = DisposeBag()
  
  let headers: [String] = [
    "Filtering"
  ]
  
  let examples: [String] = [
    "Ignoring", "Skipping", "Taking", "Distinct"
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    
    Observable.from(optional: examples)
      .bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { (row, element, cell) in
        cell.textLabel?.text = element
      }
      .disposed(by: disposeBag)
    
    tableView.rx.itemSelected
      .subscribe(
        onNext: { [weak self] indexPath in
          guard let `self` = self else { return }
          let index = indexPath.row
          let vc = BaseController()
          vc.navTitle = self.examples[index]
          self.navigationController?.pushViewController(vc, animated: true)
          print("selected : \(self.examples[index])")
        }
      )
      .disposed(by: disposeBag)
  }
}
