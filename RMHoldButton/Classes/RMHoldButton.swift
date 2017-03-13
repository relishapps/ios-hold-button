//
//  RMHoldButton.swift
//  RMHoldButtonDemo
//
//  Created by Dan Sinclair on 15/04/2016.
//  Copyright © 2016 Dan Sinclair. All rights reserved.
//

import UIKit

@IBDesignable
public class RMHoldButton: UIButton {
    
    @IBInspectable public var textColor: UIColor = UIColor.blackColor()
    @IBInspectable public var slideColor: UIColor = UIColor.redColor()
    @IBInspectable public var slideTextColor: UIColor = UIColor.whiteColor()
    @IBInspectable public var borderColor: UIColor = UIColor.redColor()
    @IBInspectable public var borderWidth: CGFloat = 0
    @IBInspectable public var cornerRadius: CGFloat = 0
    @IBInspectable public var slideDuration: NSTimeInterval = 2
    @IBInspectable public var resetDuration: NSTimeInterval = 0.5
    
    public var holdButtonCompletion: (() -> Void) = { () -> Void in }
    
    private var slideLayer: CALayer?
    private var slideLabel: UILabel!
    
    private var isAnimating: Bool = false
    
    var timePeriodTimer: NSTimer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(frame: CGRect, slideColor: UIColor, slideTextColor: UIColor, slideDuration: NSTimeInterval) {
        super.init(frame: frame)
        
        self.slideColor = slideColor
        self.slideTextColor = slideTextColor
        self.slideDuration = slideDuration
        
        self.addTargets()
    }
    
        
    public override func prepareForInterfaceBuilder()
    {
        if let context = UIGraphicsGetCurrentContext() {
            drawBackground(context, frame: self.bounds)
            self.layer.borderColor = self.borderColor.CGColor
            self.layer.borderWidth = self.borderWidth
            self.layer.cornerRadius = self.cornerRadius
            self.clipsToBounds = true
        }
    }
    
    public override func awakeFromNib()
    {
        super.awakeFromNib()
        
        self.addTargets()
        
    }
    
    private func addTargets() {
        addTarget(self, action: #selector(RMHoldButton.start(_:forEvent:)), forControlEvents: .TouchDown)
        addTarget(self, action: #selector(RMHoldButton.cancel(_:forEvent:)), forControlEvents: .TouchUpInside)
        addTarget(self, action: #selector(RMHoldButton.cancel(_:forEvent:)), forControlEvents: .TouchCancel)
        addTarget(self, action: #selector(RMHoldButton.cancel(_:forEvent:)), forControlEvents: .TouchDragExit)
        addTarget(self, action: #selector(RMHoldButton.cancel(_:forEvent:)), forControlEvents: .TouchDragOutside)
    }
    
    public override func drawRect(rect: CGRect)
    {
        super.drawRect(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            CGContextClearRect(context, rect)
            drawBackground(context, frame: self.bounds)
            self.layer.borderColor = self.borderColor.CGColor
            self.layer.borderWidth = self.borderWidth
            self.layer.cornerRadius = self.cornerRadius
            self.clipsToBounds = true
            
            self.setTitleColor(self.textColor, forState: .Normal)
            
        }
        
    }
    
    
    func start(sender: AnyObject, forEvent event: UIEvent)
    {
        
        timePeriodTimer = NSTimer.schedule(delay: slideDuration, handler: { (timer) in
            self.timePeriodTimer?.invalidate()
            self.timePeriodTimer = nil

            self.holdButtonCompletion()
            
            self.isAnimating = false
            
        })
        
        if !isAnimating {
            
            isAnimating = true
            
            self.slideLayer = CALayer()
            self.slideLayer?.masksToBounds = true
            self.slideLayer!.anchorPoint = CGPointMake(0, 0)
            self.slideLayer!.bounds = CGRectMake(0, 0, 0, self.bounds.height)
            self.slideLayer!.backgroundColor = self.slideColor.CGColor
            self.layer.insertSublayer(self.slideLayer!, above: self.layer)
            
            let textLayer = CATextLayer()
            textLayer.anchorPoint = CGPointMake(0, 0)
            textLayer.frame = (self.titleLabel?.frame)!
            textLayer.font = self.titleLabel?.font
            textLayer.fontSize = (self.titleLabel?.font.pointSize)!
            textLayer.foregroundColor = self.slideTextColor.CGColor
            textLayer.string = self.titleLabel?.text
            textLayer.alignmentMode = kCAAlignmentCenter
            textLayer.contentsScale = UIScreen.mainScreen().scale
            self.slideLayer!.addSublayer(textLayer)
            
            let animation = CABasicAnimation(keyPath: "bounds.size.width")
            animation.duration = slideDuration
            animation.fillMode = kCAFillModeForwards
            animation.removedOnCompletion = false
            if self.slideLayer!.animationKeys()?.count > 0 {
                if let temp = self.slideLayer!.presentationLayer() as? CALayer {
                    animation.fromValue = temp.bounds.width
                }
            }
            animation.toValue = self.bounds.width
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            self.slideLayer!.addAnimation(animation, forKey: "drawSlideAnimation")
            self.layer.addSublayer(self.slideLayer!)
        }
    }
    
    func cancel(sender: AnyObject, forEvent event: UIEvent)
    {
        reset()
    }
    
    func reset()
    {
        
        self.timePeriodTimer?.invalidate()
        self.timePeriodTimer = nil
        
        timePeriodTimer = NSTimer.schedule(delay: resetDuration, handler: { (timer) in
            self.timePeriodTimer?.invalidate()
            self.timePeriodTimer = nil
            
            self.slideLayer?.removeAllAnimations()
            self.slideLayer?.removeFromSuperlayer()
            self.slideLayer = nil
            
            self.isAnimating = false
        })
        
        let animation = CABasicAnimation(keyPath: "bounds.size.width")
        animation.duration = resetDuration
        animation.removedOnCompletion = true
        if self.slideLayer?.animationKeys()?.count > 0 {
            if let temp = self.slideLayer?.presentationLayer() as? CALayer {
                animation.fromValue = temp.bounds.width
            }
        }
        animation.toValue = 0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        self.slideLayer?.addAnimation(animation, forKey: "drawSlideAnimation")
        
    }
    
    
    func drawBackground(context: CGContextRef, frame: CGRect)
    {
        if let backgroundColor = self.backgroundColor {
            CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
            CGContextFillRect(context, bounds)
        }
    }

    public func setText(text: String) {
        self.setTitle(text, forState: .Normal)
    }
    
    public func setTextFont(font: UIFont) {
        self.titleLabel!.font = font
    }

}
