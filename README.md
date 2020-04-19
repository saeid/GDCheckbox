# GDCheckbox

An easy to use custom checkbox/radio button component for iOS, with support of Attributes inspector.


![untitled](https://cloud.githubusercontent.com/assets/9967486/21909175/03d46ab6-d92c-11e6-86d6-216c1b18e2e0.gif)


# Requirements
- Xcode 10+
- Swift 5
- iOS 9+

# Installation
## Cocoapods
```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'GDCheckbox'
end
```
    pod install


## Manually
------
Drag `GDCheckbox.swift` to your project!


# How to use
```swift
override func viewDidLoad() {
    super.viewDidLoad()


    let checkbox: GDCheckbox = GDCheckbox()

    // Background color of the box
    checkbox.baseColor = UIColor.white

    // In case of check box, determine the animation duration of the check mark
    checkbox.animationDuration = 1.0

    // Determine if check mark should fill with animation
    checkbox.shouldAnimate = false

    // Color of the check mark / fill area -- no matter if isCurcular is on or off
    checkbox.checkColor = UIColor.red

    // Width of the check mark / fill area -- no matter if isCurcular is on or off
    checkbox.checkWidth = 3.0

    // Color of container border. If shouldFillContainer is set to true, container background also will be override with this color when CheckBox / Radio Button is selected.
    checkbox.containerColor = UIColor.blue

    // Determine if container should be filled when selected
    // Note: if set to true, it will override `baseColor` when control is selected
    checkbox.shouldFillContainer = false

    // Border width of container view
    checkbox.containerWidth = 5.0

    // Determine if it's a check box or a radio button
    checkbox.isRadioButton = false
    
    // Determine container shpae type for selected state
    // For CheckBox -> Check mark when true or square when false
    // For RadioButton -> Check mark when true or circle when false
    checkbox.showCheckMark = false

    // Set default state of the control
    checkbox.isOn = false
    
    self.view.addSubview(checkbox)
}

@IBAction func onCheckBoxPress(_ sender: GDCheckbox) {
    let state = sender.isOn ? "ON" : "OFF"
    // Trigger action
}
```
