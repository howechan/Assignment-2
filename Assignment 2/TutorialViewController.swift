//
//  TutorialViewController.swift
//  Assignment 2
//
//  Created by Will Chan on 11/1/15.
//  Copyright © 2015 Will Chan. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var backupButton: UIButton!
    @IBOutlet weak var backupButtonImageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        let contentWidth = scrollView.bounds.width*4
        let contentHeight = scrollView.bounds.height
        
        scrollView.contentSize = CGSizeMake(contentWidth, contentHeight)
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.pagingEnabled = true
        pageControl.numberOfPages = 4
        
        backupButtonImageView.alpha = 0
        backupButton.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pageControlDidPage(sender: AnyObject) {
        
        let xOffset = scrollView.bounds.width * CGFloat(pageControl.currentPage)
        scrollView.setContentOffset((CGPointMake(xOffset, 0)), animated: true)
        
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        if pageControl.currentPage == 3 {
            
            UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.pageControl.alpha = 0
                self.backupButtonImageView.alpha = 1
                }, completion: {(Bool) in
                self.backupButton.hidden = false
            })
        } else {
            
            UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.pageControl.alpha = 1
                self.backupButtonImageView.alpha = 0
                }, completion: {(Bool) in
                self.backupButton.hidden = true
            })
            
        }
    }
    
    
    @IBAction func backupButtonDidPress(sender: AnyObject) {
        self.performSegueWithIdentifier("backupSegue", sender: self)
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
