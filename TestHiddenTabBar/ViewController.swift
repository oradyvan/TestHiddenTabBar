//
//  ViewController.swift
//  TestHiddenTabBar
//
//  Created by Alexander Lonsky on 19/03/2018.
//  Copyright © 2018 Alexander Lonsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate {

    static let storyboard: UIStoryboard = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard
    }()
    
    static var firstViewController: FirstViewController {
        return self.storyboard.instantiateViewController(withIdentifier: "first") as! FirstViewController
    }
    
    static var secondViewController: UIViewController {
        return self.storyboard.instantiateViewController(withIdentifier: "second")
    }

    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.selectedItem = self.tabBar.items?.first
        self.showUI(for: 0)
    }

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.showUI(for: item.tag)
    }
    
    private func showUI(for index: Int) {
        let viewController: UIViewController
        if index == 0 {
            let firstViewController = ViewController.firstViewController
            firstViewController.toggleTabBar = { [weak self] in
                guard let sSelf = self else {
                    return
                }
                sSelf.tabBar.isHidden = !sSelf.tabBar.isHidden
            }
            viewController = firstViewController
        } else {
            viewController = ViewController.secondViewController
        }
//        let navController = UINavigationController(rootViewController: viewController)
        self.childViewControllers.last?.removeFromParent()
        self.embed(viewController, into: self.containerView)
    }
}

