# GDCheckbox

An easy to use custom checkbox/radio button component for iOS, with support of IBDesign Inspector.


![untitled](https://cloud.githubusercontent.com/assets/9967486/21909175/03d46ab6-d92c-11e6-86d6-216c1b18e2e0.gif)


# Requirements
-Xcode 7+
-Swift 3.1
-iOS 8+


# Installation
Install manually
------
Drag `GDCheckbox.swift` to your project and use!

Install using Cocoapods
------
Soon!


# How to use
```swift
    override func viewDidLoad() {
        super.viewDidLoad()


        let checkbox: GDCheckbox = GDCheckbox()

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
        // Do some cool stuff
    }
```