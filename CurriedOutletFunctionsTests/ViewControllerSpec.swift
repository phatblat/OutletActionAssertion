//
//  ViewControllerSpec.swift
//  CurriedOutletFunctions
//
//  Created by Ben Chatelain on 4/27/16.
//  Copyright © 2016 Ben Chatelain. All rights reserved.
//

@testable import CurriedOutletFunctions
import Quick
import Nimble

class ViewControllerSpec: QuickSpec {
    override func spec() {
        // Start with an empty object so property can be non-optional
        // Also needs to be initialized before passing to curried helper functions.
        var viewController: UIViewController = ViewController()

        var hasButtonOutlet: CurriedOutletTest!
        var receivesAction: CurriedActionTest!

        beforeEach {
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ViewController")
            viewController.loadView()
            expect(viewController.view).toNot(beNil())

            hasButtonOutlet = outlet(viewController)(type: UIBarButtonItem.self)
            receivesAction = action(viewController)(type: UIBarButtonItem.self)
        }

        describe("view controller") {
            // MARK: - Outlets
            it("has a leftButton outlet") {
                hasButtonOutlet("leftButton")
            }
            it("has a rightButton outlet") {
                hasButtonOutlet("rightButton")
            }

            // MARK: - Actions
            it("receives a didTapLeftButton: action from leftButton") {
                receivesAction("didTapLeftButton:", from: "leftButton")
            }
            it("receives a didTapRightButton: action from rightButton") {
                receivesAction("didTapRightButton:", from: "rightButton")
            }
        }
    }
}
