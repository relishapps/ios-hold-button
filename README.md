# RMHoldButton

<!--[![CI Status](http://img.shields.io/travis/Dan Sinclair/RMHoldButton.svg?style=flat)](https://travis-ci.org/Dan Sinclair/RMHoldButton)-->
[![Version](https://img.shields.io/cocoapods/v/RMHoldButton.svg?style=flat)](http://cocoapods.org/pods/RMHoldButton)
[![License](https://img.shields.io/cocoapods/l/RMHoldButton.svg?style=flat)](http://cocoapods.org/pods/RMHoldButton)
[![Platform](https://img.shields.io/cocoapods/p/RMHoldButton.svg?style=flat)](http://cocoapods.org/pods/RMHoldButton)

## Requirements

## Installation

RMHoldButton is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RMHoldButton"
```

In Terminal, `cd` to the project directory and run `pod install`.

Import the lib to any class using it

```swift
import RMHoldButton
```

You can create an RMHoldButton from the Storyboard or programatically.

### Storyboard
- Drag a UIButton onto your view.
- Change it's class to `RMHoldButton`
- Edit it's appearance using the custom properties in the Attributes Inspector
- Create the button as a property of it's View Controller
- In the `viewDidLoad()` method of your View Controller, set the button's `holdButtonCompletion` property to tell the button what to do when it's done animating.

For an example of creating a RMHoldButton in storyboard, check out the example project.

### Programatically
- Initialize the button
- Set the button's `holdButtonCompletion` property to tell the button what to do when it's done animating.

Example:
```swift
let holdButton = RMHoldButton(frame: CGRect(x: 0, y: 0 , width: 200, height: 50), slideColor: UIColor.green, slideTextColor: UIColor.white, slideDuration: 1.0)
holdButton.backgroundColor = UIColor.clear
holdButton.setText("✓")
holdButton.setTextFont(UIFont.boldSystemFont(ofSize: 60))
holdButton.textColor = UIColor.green
holdButton.holdButtonCompletion = {() -> Void in
    print("Hold button has completed!")
}
holdButton.resetDuration = 0.2
holdButton.borderWidth = 3.0
holdButton.borderColor = UIColor.green
holdButton.cornerRadius = holdButton.frame.width / 2
self.view.addSubview(holdButton)
```

For a better idea of RMHoldButton's versatility, look at the example project in the repo.

## Authors

Pawel Decowski, pawel@relish.io
Dan Sinclair, dan@relish.io

## License

RMHoldButton is available under the MIT license. See the LICENSE file for more info.
