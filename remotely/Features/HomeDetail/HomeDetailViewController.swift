//
//  HomeDetailViewController.swift
//  remotely
//
//  Created by cagla copuroglu on 7.08.2022.
//

import UIKit

class HomeDetailViewController: UIViewController {

    var index: Int

    init(index: Int) {
        self.index = index
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        self.title = "\(index)'s details :)"
    }
}
