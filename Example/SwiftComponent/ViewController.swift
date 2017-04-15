//
//  ViewController.swift
//  SwiftComponent
//
//  Created by sheldon on 15/04/2017.
//  Copyright © 2017 jumpingfrog0. All rights reserved.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let path = NSSearchPathForDirectoriesInDomains(.documentationDirectory, .allDomainsMask, true)
        print(path)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        MBProgressHUD.show(in: view)
        MBProgressHUD.showSuccess(text: "成功")
//        MBProgressHUD.showError(text: "失败")
    }
}

