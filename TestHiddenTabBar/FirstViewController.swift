//
//  FirstViewController.swift
//  TestHiddenTabBar
//
//  Created by Alexander Lonsky on 19/03/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var toolBar: UIToolbar!
    var toggleTabBar: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onToggleDidPress(_ sender: Any) {
        self.toolBar.isHidden = !self.toolBar.isHidden
        self.toggleTabBar?()
    }
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//
//        coordinator.animate(alongsideTransition: { _ in
//            self.toolBar.invalidateIntrinsicContentSize()
//            self.view.updateConstraintsIfNeeded()
//        }, completion: nil)
//    }
}
