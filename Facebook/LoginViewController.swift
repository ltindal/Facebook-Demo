//
//  LoginViewController.swift
//  Facebook
//
//  Created by Lauren Tindal on 10/20/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var fieldSuperView: UIView!
    @IBOutlet weak var labelSuperview: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var logoInitialY: CGFloat!
    var fieldInitialY: CGFloat!
    var labelInitialY: CGFloat!
    
    var logoOffset: CGFloat!
    var fieldOffset: CGFloat!
    var labelOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoInitialY = logo.frame.origin.y
        logoOffset = -30
        fieldInitialY = fieldSuperView.frame.origin.y
        fieldOffset = -60
        labelInitialY = labelSuperview.frame.origin.y
        labelOffset = -200
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (Notification) in
            self.logo.frame.origin.y = self.logoInitialY + self.logoOffset
            self.fieldSuperView.frame.origin.y = self.fieldInitialY + self.fieldOffset
            self.labelSuperview.frame.origin.y = self.labelInitialY + self.labelOffset
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (Notification) in
            self.logo.frame.origin.y = self.logoInitialY
            self.fieldSuperView.frame.origin.y = self.fieldInitialY
            self.labelSuperview.frame.origin.y = self.labelInitialY
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOutside(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func didPressLogin(_ sender: AnyObject) {
        activityIndicator.startAnimating()
        
        if emailField.text == "ltindal@box.com" &&
            passwordField.text == "password" {
            
            loginButton.isSelected = true
            
            delay(2, closure: { 
               activityIndicator.stopAnimating()
                
               
                
            })
        }
        else {
            activityIndicator.stopAnimating()
            loginButton.isSelected = true
            
            delay(2, closure: {
                let alertController = UIAlertController(title: "Try Again", message: "Your email or password is incorrect.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (<#UIAlertAction#>) in
                })
                alertController.addAction(okAction)
                present(alertController, animated: true)
            })
        }
    }


}
