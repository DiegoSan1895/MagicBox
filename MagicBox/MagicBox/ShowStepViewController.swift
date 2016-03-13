//
//  ShowStepViewController.swift
//  MagicBox
//
//  Created by DiegoSan on 3/13/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

class ShowStepViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    @IBOutlet weak var titleLabelBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var subtitleLabelBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.textColor = UIColor.yepTintColor()
        
        titleLabelBottomConstraint.constant = Ruler.iPhoneVertical(20, 30, 30, 30).value
        subtitleLabelBottomConstraint.constant = Ruler.iPhoneVertical(120, 140, 160, 180).value
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        view.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            self.view.alpha = 1
            }, completion: nil)
        
    }
    
    // MARK: - Animation Methods
    
    func repeatAnimate(view: UIView, alongWithPath path: UIBezierPath, duration: CFTimeInterval, autoreverses: Bool = false) {
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        animation.calculationMode = kCAAnimationPaced
        animation.fillMode = kCAFillModeForwards
        animation.duration = duration
        animation.repeatCount = Float.infinity
        animation.autoreverses = autoreverses
        
        if autoreverses {
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
        } else {
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        }
        
        animation.path = path.CGPath
        
        view.layer.addAnimation(animation, forKey: "Animation")
    }
    
    func animate(view: UIView, offset: UInt32, duration: CFTimeInterval) {
        
        let path = UIBezierPath()
        
        func flip() -> CGFloat {
            return arc4random() % 2 == 0 ? -1 : 1
        }
        
        
    }
}
