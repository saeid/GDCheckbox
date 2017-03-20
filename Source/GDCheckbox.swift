//
//  GDCheckbox.swift
//  CheckBox
//
//  Created by Saeidbsn on 1/12/17.
//  Copyright © 2017 Saeidbsn. All rights reserved.
//  saeidbsn.com


import UIKit

@IBDesignable
class GDCheckbox: UIControl {
    //MARK: - public properties
    
    @IBInspectable
    open var containerWidth: CGFloat = 2.0{
        didSet{
            drawLayers()
        }
    }
    
    @IBInspectable
    open var containerColor: UIColor = UIColor.black{
        didSet{
            drawColors()
        }
    }
    
    @IBInspectable
    open var checkWidth: CGFloat = 3.0{
        didSet{
            drawLayers()
        }
    }
    
    @IBInspectable
    open var checkColor: UIColor = UIColor.black{
        didSet{
            drawColors()
        }
    }
    
    @IBInspectable
    open var shouldFillContainer: Bool = false{
        didSet{
            drawColors()
        }
    }
    
    @IBInspectable
    open var shouldAnimate: Bool = false{
        didSet{
            
        }
    }
    
    @IBInspectable
    open var isOn: Bool = false{
        didSet{
            drawColors()
        }
    }
    
    @IBInspectable
    open var isSquare: Bool = false{
        didSet{
            drawLayers()
        }
    }
    
    @IBInspectable
    open var isRadiobox: Bool = false{
        didSet{
            drawLayers()
        }
    }
    
    @IBInspectable
    open var isCircular: Bool = false{
        didSet{
            drawLayers()
        }
    }
    
    
    //MARK: - internal properties
    fileprivate var containerLayer = CAShapeLayer()
    fileprivate var checkLayer = CAShapeLayer()
    
    fileprivate var containerFrame: CGRect{
        let width = bounds.width
        let height = bounds.height
        
        let x: CGFloat
        let y: CGFloat
        
        let eqLength: CGFloat
        
        if width > height{
            eqLength = height
            x = (width - eqLength) / 2
            y = 0
        }else{
            eqLength = width
            x = 0
            y = (height - eqLength) / 2
        }
        
        let halfContainerWidth = containerWidth / 2
        return CGRect(x: x + halfContainerWidth, y: y + halfContainerWidth, width: eqLength - halfContainerWidth, height: eqLength - halfContainerWidth)
    }
    
    fileprivate var containerPath: UIBezierPath{
        if isRadiobox || isCircular{
            return UIBezierPath(ovalIn: containerFrame)
        }else{
            return UIBezierPath(rect: containerFrame)
        }
    }
    
    fileprivate var checkPath: UIBezierPath{
        let containerFrame = self.containerFrame
        
        let inset = containerWidth / 2
        let checkFrame = containerFrame.insetBy(dx: inset, dy: inset)
        
        let path = UIBezierPath()
        let origin = checkFrame.origin
        let x = origin.x
        let y = origin.y
        
        if isSquare{
            let unit = checkFrame.width / 4
            
            path.move(to: CGPoint(x: x + unit, y: y + unit))
            path.addLine(to: CGPoint(x: x + unit, y: y + (3 * unit)))
            path.addLine(to: CGPoint(x: x + (3 * unit), y: y + (3 * unit)))
            path.addLine(to: CGPoint(x: x + (3 * unit), y: y + unit))
            path.addLine(to: CGPoint(x: x +  unit, y: y + unit))
            path.close()
        }else if isRadiobox{
            let unit = checkFrame.width / 4
            
            path.addArc(withCenter: CGPoint(x: x + (2 * unit), y: y + (2 * unit)), radius: containerFrame.width / 3 - checkWidth, startAngle: 0.0, endAngle: CGFloat(2 * M_PI), clockwise: true)
        }else{
            let unit = checkFrame.width / 33
            
            path.move(to: CGPoint(x: x + (7 * unit), y: y + (18 * unit)))
            path.addLine(to: CGPoint(x: x + (14 * unit), y: y + (25 * unit)))
            path.addLine(to: CGPoint(x: x + (27 * unit), y: y + (10 * unit)))
        }
        return path
    }
    
    //MARK: - layouts
    public override func layoutSubviews() {
        super.layoutSubviews()
        drawLayers()
    }
    
    fileprivate func drawLayers(){
        containerLayer.frame = bounds
        containerLayer.lineWidth = containerWidth
        containerLayer.path = containerPath.cgPath
        
        checkLayer.frame = bounds
        checkLayer.lineWidth = checkWidth
        checkLayer.path = checkPath.cgPath
        checkLayer.lineJoin = "round"
    }
    
    fileprivate func drawColors(){
        containerLayer.strokeColor = containerColor.cgColor
        
        if isOn{
            containerLayer.fillColor = shouldFillContainer ? containerColor.cgColor : UIColor.clear.cgColor
            
            if shouldAnimate && !isRadiobox && !isSquare{
                checkLayer.strokeColor = checkColor.cgColor
                
                let anim = CABasicAnimation(keyPath: "strokeEnd")
                anim.duration = 0.2
                anim.fromValue = 0.0
                anim.toValue = 1.0
                
                checkLayer.add(anim, forKey: "stroke")
            }else{
                if isSquare{
                    checkLayer.fillColor = checkColor.cgColor
                }else if isRadiobox{
                    checkLayer.fillColor = checkColor.cgColor
                }else{
                    checkLayer.strokeColor = checkColor.cgColor
                }
            }
        }else{
            containerLayer.fillColor = UIColor.clear.cgColor
            if isSquare{
                checkLayer.fillColor = UIColor.clear.cgColor
            }else if isRadiobox{
                checkLayer.fillColor = UIColor.clear.cgColor
            }else{
                checkLayer.strokeColor = UIColor.clear.cgColor
            }
        }
        self.setNeedsDisplay()
    }
    
    //MARK: - initialization
    fileprivate func initializeCheckbox(){
        checkLayer.fillColor = UIColor.clear.cgColor
        
        drawLayers()
        drawColors()
        
        layer.addSublayer(containerLayer)
        layer.addSublayer(checkLayer)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeCheckbox()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initializeCheckbox()
    }
    
    //MARK: - touch events
    internal override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        isOn = !isOn
        sendActions(for: [.valueChanged])

        return true
    }
}
