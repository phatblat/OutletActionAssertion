//
//  SpecFunctions.swift
//  CurriedOutletFunctions
//
//  Created by Ben Chatelain on 6/6/15.
//  Copyright (c) 2015-2016 Ben Chatelain.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Quick
import Nimble
import UIKit

// MARK: - Outlets
typealias FullCurriedOutletTest = (UIViewController) -> (String -> AnyObject?)
typealias CurriedOutletTest = String -> AnyObject?
typealias CurriedButtonTest = String -> UIButton?
typealias CurriedBarButtonItemTest = String -> UIBarButtonItem?
typealias CurriedSegmentedControlTest = String -> UISegmentedControl?
typealias CurriedLabelTest = String -> UILabel?
typealias CurriedImageTest = String -> UIImageView?

private func outlet(viewController: UIViewController)(_ outlet: String) -> AnyObject? {
    guard let object = viewController.valueForKey(outlet)
        else { fail("\(outlet) outlet was nil"); return nil }

    return object
}

func outlet<T>(viewController: UIViewController)(_ expectedOutlet: String) -> T? {
    guard let object = outlet(viewController)(expectedOutlet)
        else { return nil }

    debugPrint(object.dynamicType)

    guard let objectOfType = object as? T
        else { fail("\(object) outlet was not a \(T.self)"); return nil }

    return objectOfType
}

// MARK: - Actions
typealias FullCurriedActionTest = (UIViewController) -> ((String, from: String) -> Void)
typealias CurriedActionTest = (String, from: String) -> Void

func action(viewController: UIViewController)
    (_ expectedAction: String, from expectedOutlet: String) {

    let optionalControl = outlet(viewController)(expectedOutlet)

    var target: AnyObject?
    var action: String?

    if let control = optionalControl {
        switch control {
        case let button as UIBarButtonItem:
            target = button.target
            action = button.action.description
        case let control as UIControl:
            target = control.allTargets().first!
            var allActions: [String] = []
            for event: UIControlEvents in [.TouchUpInside, .ValueChanged] {
                allActions += control.actionsForTarget(target!, forControlEvent: event) ?? []
            }

            // Filter down to the expected action
            action = allActions.filter({$0 == expectedAction}).first!
        default:
            fail("Unhandled control type: \(control.dynamicType)")
        }
    }

    expect(target) === viewController
    expect(action).toNot(beNil())
    if let action = action {
        expect(action) == expectedAction
    }
}