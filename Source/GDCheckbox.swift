//
//  GDCheckbox.swift
//  CheckBox
//
//  Created by Saeidbsn on 1/12/17.
//  Copyright © 2017 Saeid Basirnia. All rights reserved.
// 	basirnia.dev


import UIKit

@IBDesignable
final public class GDCheckbox: UIControl {
	//MARK: - Public variables
	@IBInspectable
	public var animationDuration: Double = 0.2
	@IBInspectable
	public var shouldAnimate: Bool = false
	
	@IBInspectable
	public var containerWidth: CGFloat = 2.0 {
		didSet {
			drawLayers()
		}
	}
	
	@IBInspectable
	public var containerColor: UIColor = UIColor.black {
		didSet {
			drawColors()
		}
	}
	
	@IBInspectable
	public var baseColor: UIColor = UIColor.clear {
		didSet {
			containerLayer.fillColor = baseColor.cgColor
		}
	}
	
	@IBInspectable
	public var checkWidth: CGFloat = 3.0 {
		didSet {
			drawLayers()
		}
	}
	
	@IBInspectable
	public var checkColor: UIColor = UIColor.black {
		didSet {
			drawColors()
		}
	}
	
	@IBInspectable
	public var shouldFillContainer: Bool = false {
		didSet {
			drawColors()
		}
	}
	
	@IBInspectable
	public var isOn: Bool = false {
		didSet{
			drawColors()
		}
	}
	
	@IBInspectable
	public var showCheckMark: Bool = true {
		didSet {
			drawLayers()
		}
	}
	
	@available(swift, obsoleted: 5.0, renamed: "isRadioButton")
	public var isRadiobox: Bool = false {
		didSet {
			drawLayers()
		}
	}
	
	@IBInspectable
	public var isRadioButton: Bool = false {
		didSet {
			drawLayers()
		}
	}

	// MARK: - Init
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		initializeCheckbox()
	}
	
	public override init(frame: CGRect) {
		super.init(frame: frame)
		initializeCheckbox()
	}
	
	//MARK: - Internal variables
	fileprivate var containerLayer = CAShapeLayer()
	fileprivate var checkLayer = CAShapeLayer()
	
	fileprivate var containerFrame: CGRect {
		let width = bounds.width
		let height = bounds.height
		let x: CGFloat
		let y: CGFloat
		let length: CGFloat
		
		if width > height {
			length = height
			x = (width - length) / 2
			y = 0
		} else {
			length = width
			x = 0
			y = (height - length) / 2
		}
		
		let halfContainerWidth = containerWidth / 2
		return CGRect(x: x + halfContainerWidth, y: y + halfContainerWidth, width: length - halfContainerWidth, height: length - halfContainerWidth)
	}
	
	fileprivate var containerPath: UIBezierPath {
		if isRadioButton {
			return UIBezierPath(ovalIn: containerFrame)
		} else {
			return UIBezierPath(rect: containerFrame)
		}
	}
	
	fileprivate var checkPath: UIBezierPath {
		let containerFrame = self.containerFrame
		let inset = containerWidth / 2
		let checkFrame = containerFrame.insetBy(dx: inset, dy: inset)
		let path = UIBezierPath()
		let origin = checkFrame.origin
		let x = origin.x
		let y = origin.y
		
		if !showCheckMark && !isRadioButton {
			let unit = checkFrame.width / 4
			
			path.move(to: CGPoint(x: x + unit, y: y + unit))
			path.addLine(to: CGPoint(x: x + unit, y: y + (3 * unit)))
			path.addLine(to: CGPoint(x: x + (3 * unit), y: y + (3 * unit)))
			path.addLine(to: CGPoint(x: x + (3 * unit), y: y + unit))
			path.addLine(to: CGPoint(x: x +  unit, y: y + unit))
			path.close()
		} else if !showCheckMark && isRadioButton {
			let unit = checkFrame.width / 4
			
			path.addArc(withCenter: CGPoint(x: x + (2 * unit), y: y + (2 * unit)), radius: containerFrame.width / 3 - checkWidth, startAngle: 0.0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
		} else {
			let unit = checkFrame.width / 33
			
			path.move(to: CGPoint(x: x + (7 * unit), y: y + (18 * unit)))
			path.addLine(to: CGPoint(x: x + (14 * unit), y: y + (25 * unit)))
			path.addLine(to: CGPoint(x: x + (27 * unit), y: y + (10 * unit)))
		}
		return path
	}
	
	//MARK: - Layouts
	public override func layoutSubviews() {
		super.layoutSubviews()
		drawLayers()
	}
	
	fileprivate func drawLayers() {
		containerLayer.frame = bounds
		containerLayer.lineWidth = containerWidth
		containerLayer.path = containerPath.cgPath
		checkLayer.frame = bounds
		checkLayer.lineWidth = checkWidth
		checkLayer.path = checkPath.cgPath
		checkLayer.lineJoin = CAShapeLayerLineJoin.round
		checkLayer.lineCap = CAShapeLayerLineCap.round
	}
	
	fileprivate func drawColors() {
		DispatchQueue.main.async {
			self.containerLayer.strokeColor = self.containerColor.cgColor
			
			if self.isOn {
				self.containerLayer.fillColor = self.shouldFillContainer ?
					self.containerColor.cgColor : self.baseColor.cgColor
				
				if self.shouldAnimate && self.showCheckMark {
					self.checkLayer.strokeColor = self.checkColor.cgColor
					
					let anim = CABasicAnimation(keyPath: "strokeEnd")
					anim.duration = self.animationDuration
					anim.fromValue = 0.0
					anim.toValue = 1.0
					
					self.checkLayer.add(anim, forKey: "stroke")
				} else {
					if !self.showCheckMark {
						self.checkLayer.fillColor = self.checkColor.cgColor
					} else {
						self.checkLayer.strokeColor = self.checkColor.cgColor
					}
				}
			} else {
				self.containerLayer.fillColor = self.baseColor.cgColor
				if !self.showCheckMark {
					self.checkLayer.fillColor = UIColor.clear.cgColor
				} else {
					self.checkLayer.strokeColor = UIColor.clear.cgColor
				}
			}
			self.setNeedsDisplay()
		}
	}
	
	//MARK: - Initialization
	fileprivate func initializeCheckbox() {
		checkLayer.fillColor = UIColor.clear.cgColor
		
		drawLayers()
		drawColors()
		
		layer.addSublayer(containerLayer)
		layer.addSublayer(checkLayer)
	}
	
	//MARK: - Touch events
	public override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		isOn = !isOn
		sendActions(for: [.valueChanged])
		
		return true
	}
}
