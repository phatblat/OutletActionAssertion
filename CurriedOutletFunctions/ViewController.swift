//
//  ViewController.swift
//  CurriedOutletFunctions
//
//  Created by Ben Chatelain on 4/27/16.
//  Copyright © 2016 Ben Chatelain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var leftButton: UIBarButtonItem!
    @IBOutlet var rightButton: UIBarButtonItem!
}

// MARK: - IBAction Methods
extension ViewController {
    @IBAction func didTapLeftButton(button: UIBarButtonItem) {
        print("didTapLeftButton")
    }

    @IBAction func didTapRightButton(button: UIBarButtonItem) {
        print("didTapRightButton")
    }
}
