//
//  ShowSetpGeniusViewController.swift
//  MagicBox
//
//  Created by DiegoSan on 3/13/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

class ShowStepGeniusViewController: ShowStepViewController {

    @IBOutlet private weak var dotsImageView: UIImageView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = NSLocalizedString("Genius", comment: "")
        subtitleLabel.text = NSLocalizedString("Discover them around you", comment: "")
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let dotsPath = UIBezierPath(arcCenter: dotsImageView.center, radius: 7, startAngle: 0, endAngle: 2, clockwise: false)
        repeatAnimate(dotsImageView, alongWithPath: dotsPath, duration: 7, autoreverses: true)
    }
    
    
}
