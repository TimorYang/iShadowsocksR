//
//  CollectionViewController.swift
//
//  Created by LEI on 5/31/16.
//  Copyright © 2016 TouchingApp. All rights reserved.
//

import Foundation
import Cartography

private let rowHeight: CGFloat = 135

class CollectionViewController: SegmentPageVC {

    let pageVCs = [
        ProxyRuleSetListViewController(),
        ProxyListViewController(),
    ]

    override func pageViewControllersForSegmentPageVC() -> [UIViewController] {
        return pageVCs
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPage(1)
    }

    override func segmentsForSegmentPageVC() -> [String] {
        return ["Rule Set".localized(), "Proxy".localized()]
    }

    override func showPage(_ index: Int) {
        if index < 2 {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        }else {
            navigationItem.rightBarButtonItem = nil
        }
        super.showPage(index)
    }

    @objc func add() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let vc = ProxyRuleSetConfigurationViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let ac = (self.pageVCs[1] as! ProxyListViewController).imprortProxyNodeController()
            self.present(ac, animated: true)
        default:
            break
        }
    }
    
}

