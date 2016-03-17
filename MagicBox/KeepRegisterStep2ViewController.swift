//
//  KeepRegisterStep2ViewController.swift
//  MagicBox
//
//  Created by DiegoSan on 3/16/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import AVOSCloud
import IBAnimatable

class KeepRegisterStep2ViewController: KeepRegisterViewController {
    
    var targerUser: AVUser!
    
    @IBOutlet weak var photoButon: UIButton!
    @IBOutlet weak var reGetCodeButton: AnimatableButton!
    @IBOutlet weak var verifyCode: UITextField!
    @IBOutlet weak var passcodeField: AnimatableTextField!
    @IBOutlet weak var cuteName: AnimatableTextField!
    
    @IBOutlet weak var topLayoutGuideConstraint: NSLayoutConstraint!
    @IBAction func photoButonDidPressed(sender: UIButton) {
        
    }
    
    @IBAction func registetrButtonDidPressed(sender: AnimatableButton) {
        
    }
    
    @IBAction func reGetButtonDidPressed(sender: AnimatableButton) {
        
    }
    
    @IBAction func viewTouched(sender: UIView) {
        
        verifyCode.resignFirstResponder()
        passcodeField.resignFirstResponder()
        cuteName.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillShow", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillHide", name: UIKeyboardWillHideNotification, object: nil)
        
//        verifyCode.delegate = self
//        passcodeField.delegate = self
//        cuteName.delegate = self
    }
    
    // deal with keyboard
    /**
    two ways to deal with keyboard
    1. UIKeyboardNotificaiton
    2. UITextFieldDelegate
    */
    func keyBoardWillShow(){
        
        let kHeight35: CGFloat = -60
        let kHeight4: CGFloat = -30
        let kHeight47: CGFloat = 10
        let kHeight55: CGFloat = 20
        let animationDuration = 1.0
        
        if verifyCode.isFirstResponder(){
            
            UIView.animateWithDuration(animationDuration, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
                self.topLayoutGuideConstraint.constant = Ruler.iPhoneVertical(kHeight35, kHeight4, kHeight47, kHeight55).value
                self.view.layoutIfNeeded()
                }, completion: nil)
            
        }else if passcodeField.isFirstResponder(){
            
            UIView.animateWithDuration(animationDuration, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
                self.topLayoutGuideConstraint.constant = Ruler.iPhoneVertical(kHeight35 - 40, kHeight4 - 40, kHeight47 - 40, kHeight55 - 40).value
                self.view.layoutIfNeeded()
                
                }, completion: nil)
            
        }else if cuteName.isFirstResponder(){
            
            UIView.animateWithDuration(animationDuration, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
                self.topLayoutGuideConstraint.constant = Ruler.iPhoneVertical(kHeight35 - 70, kHeight4 - 70, kHeight47 - 70, kHeight55 - 70).value
                self.view.layoutIfNeeded()
                
                }, completion: nil)
        }else{
            topLayoutGuideConstraint.constant = 20
        }
    }
    
    func keyBoardWillHide() {
        spring(0.6) { () -> Void in
            self.topLayoutGuideConstraint.constant = 20
            self.view.layoutIfNeeded()
        }
    }
}

extension KeepRegisterStep2ViewController: UITextFieldDelegate{
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        keyBoardWillShow()
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        keyBoardWillHide()
        return true
    }
}
