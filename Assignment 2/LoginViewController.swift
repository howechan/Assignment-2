//
//  LoginViewController.swift
//  Assignment 2
//
//  Created by Will Chan on 10/30/15.
//  Copyright © 2015 Will Chan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var loginNavBar: UIImageView!
    var buttonParentViewInitialY: CGFloat!
    var buttonParentViewOffset: CGFloat! = 100
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        scrollView.contentSize = CGSize(width: 320, height: 600)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        buttonParentViewInitialY = buttonParentView.frame.origin.y
        
    
    }
    
    override func viewWillAppear(animated: Bool) {
        let transform = CGAffineTransformMakeScale(0.9, 0.9)
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0

        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.2) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
        
    }

    @IBAction func signInButtonDidPress(sender: AnyObject) {
        

        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            let alertController = UIAlertController(title: "Email and Password Required", message: "Please enter your email and password", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) in
            })
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true){
            }


        } else {
            activityIndicator.startAnimating()
            
            delay(2.0) { () -> () in
                
                self.checkPassword()
            }
        }
        
        
        
    }
    
    func checkPassword() {
        if emailField.text == "example@fb.com" && passwordField.text == "password" {
            
            self.performSegueWithIdentifier("signInSegue", sender: nil)
            
        } else {
            let alertController = UIAlertController(title: "Access Denied", message: "Wrong username or password", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) in
            })
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true){
                self.activityIndicator.stopAnimating()
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
        
        buttonParentView.frame.origin = CGPoint(x: buttonParentView.frame.origin.x, y: self.buttonParentViewInitialY - buttonParentViewOffset)
        let maxContentOffsetY = scrollView.contentSize.height - scrollView.frame.size.height
        // Scroll the scrollview up to the maximum contentOffset
        scrollView.contentOffset.y = maxContentOffsetY
        // Enable scrolling while keyboard is shown
        scrollView.scrollEnabled = true
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        buttonParentView.frame.origin = CGPoint(x: buttonParentView.frame.origin.x, y: self.buttonParentViewInitialY)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y <= -50 {
            view.endEditing(true)
        }
    }

    @IBAction func backButtonDidPress(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
