//
//  KeepRegisterViewController.swift
//  MagicBox
//
//  Created by DiegoSan on 3/15/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

class KeepRegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    private func setUpUI() {
        
        view.backgroundColor = UIColor.keepRegisterBackgroundColor()
        navigationController?.navigationBar.barTintColor = UIColor.keepNagigationBarColor()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.barStyle = .Black
        
        navigationController?.navigationBar.hidden = false
        
        title = NSLocalizedString("Register", comment: "")
        
        navigationController?.navigationBar.items?.first?.title = ""
        
        
    }

}
