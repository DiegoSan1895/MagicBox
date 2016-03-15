//
//  ShowViewController.swift
//  MagicBox
//
//  Created by DiegoSan on 3/13/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import SnapKit

let ShowStepGeniusViewControllerIdentifier = "ShowStepGeniusViewController"
let ShowStepMatchViewControllerIdentifier = "ShowStepMatchViewController"
let ShowStepMeetViewControllerIdentifier = "ShowStepMeetViewController"

class ShowViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var rigisterButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var steps = [ShowStepViewController]()
    
    private var timer: NSTimer!
    // MARK: - Actions
    
    @IBAction func login(sender: UIButton) {
        
    }
    
    @IBAction func register(sender: UIButton) {
        
    }
    
    @IBAction func pageControllClick(sender: UIPageControl) {
        
        scrollView.setContentOffset(CGPoint(x: CGFloat(sender.currentPage) * scrollView.bounds.width, y: 0), animated: true)

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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        startTimer()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        stopTimer()
    }
    
    private func startTimer() {
        
        timer = NSTimer(timeInterval: 3.0, target: self, selector: "nextPage:", userInfo: nil, repeats: true)
        
        NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        timer.fire()
    }
    
    private func stopTimer() {
        
        timer.invalidate()
    }
    
    @objc private func nextPage(timer: NSTimer) {
        
        let nextPage = pageControl.currentPage + 1
        
        if nextPage >= steps.count {
            
            pageControl.currentPage = 0
        }else {
            
            pageControl.currentPage = nextPage
        }
        
        pageControllClick(pageControl)
        
    }
    
    private func setUpUI() {
        
        let stepA = stepGenius()
        let stepB = stepMatch()
        let stepC = stepMeet()
        
        steps = [stepA, stepB, stepC]
        
        scrollView.delegate = self
        
        pageControl.numberOfPages = steps.count
        pageControl.currentPageIndicatorTintColor = UIColor.yepTintColor()
        pageControl.pageIndicatorTintColor = UIColor.yepBorderColor()
        
        rigisterButton.setTitle(NSLocalizedString("Sign Up", comment: ""), forState: .Normal)
        loginButton.setTitle(NSLocalizedString("Login", comment: ""), forState: .Normal)
        
        rigisterButton.backgroundColor = UIColor.yepTintColor()
        loginButton.setTitleColor(UIColor.yepInputTextColor(), forState: .Normal)
        
        // constrains use VFL
        
        
//        let verticalPadding = CGFloat(-20)
//        let metrics = ["vp": verticalPadding]
//        
//        let viewsDictionary = [
//        "view": view,
//        "stepA": stepA.view,
//        "stepB": stepB.view,
//        "stepC": stepC.view,
//        ]
//        
//        let vConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-vp-[stepA(==view)]|", options: [], metrics: metrics, views: viewsDictionary)
//        
//        NSLayoutConstraint.activateConstraints(vConstraints)
//        
//        let hConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[stepA(==view)][stepB(==view)][stepC(==view)]|", options: [.AlignAllBottom, .AlignAllTop], metrics: nil, views: viewsDictionary)
//        
//        NSLayoutConstraint.activateConstraints(hConstraints)

        
        
        // use SnapKit
        
       scrollView.contentSize = CGSize(width: view.bounds.width * CGFloat(steps.count), height: scrollView.bounds.height)
        stepA.view.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(scrollView.snp_width)
            make.height.equalTo(scrollView.snp_height)
            make.top.equalTo(scrollView.snp_top).offset(-20)
            make.leading.equalTo(scrollView.snp_leading)
        }
        
        stepB.view.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(scrollView.snp_width)
            make.height.equalTo(scrollView.snp_height)
            make.leading.equalTo(stepA.view.snp_trailing)
            make.top.equalTo(scrollView.snp_top).offset(-20)
        }
        
        stepC.view.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(scrollView.snp_width)
            make.height.equalTo(scrollView.snp_height)
            make.top.equalTo(scrollView.snp_top).offset(-20)
            make.leading.equalTo(stepB.view.snp_trailing)

        }
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