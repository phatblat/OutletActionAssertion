//
//  ViewController.swift
//  OutletActionAssertion
//
//  Created by Ben Chatelain on 4/27/16.
//  Copyright © 2016 Ben Chatelain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var leftButton: UIBarButtonItem!
    @IBOutlet private var rightButton: UIBarButtonItem!
    @IBOutlet private var segmentedControl: UISegmentedControl!
}

// MARK: - IBAction Methods
extension ViewController {
    @IBAction func didTapLeftButton(button: UIBarButtonItem) {
        print("didTapLeftButton:")
    }

    @IBAction func didTapRightButton(button: UIBarButtonItem) {
        print("didTapRightButton:")
    }

    @IBAction func segmentedControlValueDidChange(segmentedControl: UISegmentedControl) {
        print("segmentedControlValueDidChange:")
    }
}
