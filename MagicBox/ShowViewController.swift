//
//  ShowViewController.swift
//  MagicBox
//
//  Created by DiegoSan on 3/13/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

let ShowStepGeniusViewControllerIdentifier = "ShowStepGeniusViewController"
let ShowStepMatchViewControllerIdentifier = "ShowStepMatchViewController"
let ShowStepMeetViewControllerIdentifier = "ShowStepMeetViewController"

class ShowViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var rigisterButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var steps = [ShowStepViewController]()
    // MARK: - Actions
    
    @IBAction func login(sender: UIButton) {
    }
    @IBAction func register(sender: UIButton) {
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        
    }
    private func setUpUI() {
        
        let stepA = stepGenius()
        let stepB = stepMatch()
        let stepC = stepMeet()
        
        steps = [stepA, stepB, stepC]
        
        scrollView.delegate = self
        scrollView.contentInset = UIEdgeInsetsZero
        
        pageControl.numberOfPages = steps.count
        pageControl.currentPageIndicatorTintColor = UIColor.yepTintColor()
        pageControl.pageIndicatorTintColor = UIColor.yepBorderColor()
        
        rigisterButton.setTitle(NSLocalizedString("Sign Up", comment: ""), forState: .Normal)
        loginButton.setTitle(NSLocalizedString("Login", comment: ""), forState: .Normal)
        
        rigisterButton.backgroundColor = UIColor.yepTintColor()
        loginButton.setTitleColor(UIColor.yepInputTextColor(), forState: .Normal)
        
        // constrains
        
        let viewsDictionary = [
            "view": view,
            "stepA": stepA.view,
            "stepB": stepB.view,
            "stepC": stepC.view,
        ]
        
        let vConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[stepA(==view)]|", options: [], metrics: nil, views: viewsDictionary)
        
        NSLayoutConstraint.activateConstraints(vConstraints)
        
        let hConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[stepA(==view)][stepB(==view)][stepC(==view)]|", options: [.AlignAllBottom, .AlignAllTop], metrics: nil, views: viewsDictionary)
        
        NSLayoutConstraint.activateConstraints(hConstraints)

    }
    
    // MARK: - private methods
    
    private func stepGenius() -> ShowStepGeniusViewController{
        
        let genius = storyboard?.instantiateViewControllerWithIdentifier(ShowStepGeniusViewControllerIdentifier) as! ShowStepGeniusViewController
        
        genius.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(genius.view)
        
        addChildViewController(genius)
        genius.didMoveToParentViewController(self)
        
        return genius
    }
    
    private func stepMatch() -> ShowStepMatchViewController {
        let step = storyboard!.instantiateViewControllerWithIdentifier(ShowStepMatchViewControllerIdentifier) as! ShowStepMatchViewController
        
        step.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(step.view)
        
        addChildViewController(step)
        step.didMoveToParentViewController(self)
        
        return step
    }
    
    private func stepMeet() -> ShowStepMeetViewController {
        let step = storyboard!.instantiateViewControllerWithIdentifier(ShowStepMeetViewControllerIdentifier) as! ShowStepMeetViewController
        
        step.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(step.view)
        
        addChildViewController(step)
        step.didMoveToParentViewController(self)
        
        return step
    }
    
}

// MARK: - ScrollViewDelegate

extension ShowViewController: UIScrollViewDelegate{
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let pageWidth = CGRectGetWidth(scrollView.bounds)
        let pageFraction = scrollView.contentOffset.x / pageWidth
        
        
        let page = Int(round(pageFraction))
        
        pageControl.currentPage = page
    }
}