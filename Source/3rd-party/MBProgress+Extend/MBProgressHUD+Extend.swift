//  MBProgressHUD+Extend.swift
//  SwiftComponent
//
//  Created by jumpingfrog0 on 16/04/2017.
//
//
//  Copyright (c) 2017 Jumpingfrog0 LLC
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import MBProgressHUD

class MBProgressHUDConfig {
    
    static let sharedConfig = MBProgressHUDConfig()
    
    var enablei18n = false
    var loadingTitle = "Loading..."
    var processingTitle = "Processing..."
    var successImageName = "MBProgressHUD.bundle/success.png"
    var errorImageName = "MBProgressHUD.bundle/error.png"}

extension MBProgressHUD {
    
    class func show(in view: UIView) {
        show(in: view, message: nil)
    }
    
    class func show(in view: UIView, message: String?) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        
        var msg = message
        if MBProgressHUDConfig.sharedConfig.enablei18n && message != nil {
            msg = NSLocalizedString(message!, comment: "HUD loading title")
        }
        hud.label.text = msg
    }
    
    class func hide(for view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    class func showLoading(in view: UIView) {
        show(in: view, message: MBProgressHUDConfig.sharedConfig.loadingTitle)
    }
    
    class func showProcessing(in view: UIView) {
        show(in: view, message: MBProgressHUDConfig.sharedConfig.processingTitle)
    }
    
    class func showSuccess(text: String) {
        let name = MBProgressHUDConfig.sharedConfig.successImageName
        showWithCustomView(UIImageView(image: UIImage(named: name)), text: text)
    }
    
    class func showError(text: String) {
        let name =  MBProgressHUDConfig.sharedConfig.errorImageName
        showWithCustomView(UIImageView(image: UIImage(named: name)), text: text)
    }
    
    /// If show in the window of rootViewController, should using at viewDidAppear: instead of viewDidLoad:(Because it will be invisible), other does not matter.
    private class func showWithCustomView(_ customView: UIView, text: String?) {
        if let window = UIApplication.shared.delegate?.window {
            let hud = MBProgressHUD.showAdded(to: window!, animated: true)
            
            var msg = text
            if MBProgressHUDConfig.sharedConfig.enablei18n && text != nil {
                msg = NSLocalizedString(text!, comment: "HUD loading title")
            }
            hud.label.text = msg
            hud.customView = customView
            hud.mode = .customView
            hud.removeFromSuperViewOnHide = true
            hud.hide(animated: true, afterDelay: 1.5)
        }
    }
}

