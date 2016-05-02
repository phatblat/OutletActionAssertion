# IBOutlet and IBAction Assertion

An example of testing IBOutlets and IBActions with curried functions in Swift 2.2.

Head on over to the accompanying [reflog post](http://phatbl.at/2016/04/29/testing-iboutlets-and-ibactions-with-curried-functions-in-swift.html) for an explanation of this project.

## Setup

The `OutletActionAssertionTests` project uses the [Quick](https://github.com/Quick/Quick) and [Nimble](https://github.com/Quick/Nimble) frameworks installed through [CocoaPods](https://github.com/Quick/Nimble) 0.39. The `Pods` folder is not checked in so you will need to run the `pod install` command after cloning this repo before the

Use [Bundler](http://bundler.io) to install and execute the right version of CocoaPods even after 1.0 is released.

```bash
bundle install
bundle exec pod install
```

Open `OutletActionAssertion.xcworkspace` and run the tests (Product > Test, or **⌘U**).

## License

This repo is licensed under the MIT License. See the [LICENSE](LICENSE.md) file for rights and limitations.
