//
//  SettingsViewController.swift
//  Assignment 2
//
//  Created by Will Chan on 11/2/15.
//  Copyright © 2015 Will Chan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var settingsImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = settingsImageView.image!.size
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonDidPress(sender: AnyObject) {
        
        
        self.dismissViewControllerAnimated(true) { () -> Void in
        }
    }
    
    
    @IBAction func signOutButtonDidPress(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Sign Out", message: "Are you sure you want to sign out?", preferredStyle: .ActionSheet)
        
        let logoutAction = UIAlertAction(title: "Sign Out", style: .Destructive) { (action) in
            
            self.performSegueWithIdentifier("returnSegue", sender: self)
            
        }
        alertController.addAction(logoutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
        }
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true) {
            
        }
        
        
        
    }

    

}
