# GDCheckbox

An easy to use custom checkbox/radio button component for iOS, with support of IBDesign Inspector.


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
    pod update
    pod install


## Manually
------
Drag `GDCheckbox.swift` to your project and use!


# How to use
```swift
    override func viewDidLoad() {
        super.viewDidLoad()


        let checkbox: GDCheckbox = GDCheckbox()

        checkbox.baseColor = UIColor.white
        checkbox.animationDuration = 1.0
        checkbox.checkColor = UIColor.red
        checkbox.checkWidth = 3.0
        checkbox.containerColor = UIColor.blue
        checkbox.containerWidth = 5.0
        checkbox.isCircular = true
        checkbox.isOn = false
        checkbox.isRadiobox = false
        checkbox.isSquare = false
        checkbox.shouldAnimate = false
        checkbox.shouldFillContainer = false
        
        self.view.addSubview(checkbox)
    }

    @IBAction func onCheckBoxPress(_ sender: GDCheckbox) {
        let state = sender.isOn ? "ON" : "OFF"
        // Trigger action
    }
```
