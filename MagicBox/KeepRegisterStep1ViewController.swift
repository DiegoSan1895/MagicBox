//
//  KeepRegisterStep1ViewController.swift
//  MagicBox
//
//  Created by DiegoSan on 3/15/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import IBAnimatable
import SVProgressHUD
import AVOSCloud

class KeepRegisterStep1ViewController: KeepRegisterViewController {

    @IBOutlet weak var phoneNumberTextField: AnimatableTextField!
    @IBOutlet weak var getCodeButton: AnimatableButton!
    
    @IBOutlet weak var wechatButton: UIButton!
    @IBOutlet weak var qqButton: UIButton!
    @IBOutlet weak var sinaButton: UIButton!
    
    @IBOutlet var toastView: UIView!
    
    @IBAction func getCodeButtonDidPressed(sender: UIButton) {
        
        guard let text = phoneNumberTextField.text else{
            return
        }
        
        if !NSString.isMobileNumber(text) {
            if !isShowingToastView{
                showToastView()
            }else{
                return
            }
        }else{
            //SVProgressHUD.show()
            
            let user = AVUser()
            user.mobilePhoneNumber = text
            user.password = "Beyond"
            user.username = "DiegoSan"
            
            user.signUpInBackgroundWithBlock({ (success, error) -> Void in
                let step2VC = self.storyboard?.instantiateViewControllerWithIdentifier("KeepRegisterStep2ViewController") as! KeepRegisterStep2ViewController
                
                self.navigationController?.pushViewController(step2VC, animated: true)
            })
        }
        
    }
    
    private var isShowingToastView: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCodeButton.backgroundColor = UIColor.keepGetCodeButtonColor()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
        
    private func showToastView() {
        
        isShowingToastView = true
        toastView.frame = CGRect(x: 0, y: 0, width:view.frame.width, height: 20)
        view.addSubview(toastView)
        
        springWithCompletion(0.5, animations: { () -> Void in
            
            self.toastView.transform = CGAffineTransformMakeTranslation(0, self.phoneNumberTextField.frame.origin.y - 20)
            }) { (success) -> Void in
                if success {
                    
                    UIView.animateWithDuration(0.5, delay: 1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                        self.toastView.transform = CGAffineTransformIdentity
                        }, completion: { (success) -> Void in
                            self.isShowingToastView = false
                    })
                }
        }
    }
}

