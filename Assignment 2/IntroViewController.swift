//
//  IntroViewController.swift
//  Assignment 2
//
//  Created by Will Chan on 10/30/15.
//  Copyright © 2015 Will Chan. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    
    
    var yOffsets: [CGFloat] = [-285, -240, -415, -408, -480, -500]
    var xOffsets: [CGFloat] = [-30, 75, -66, 10, -200, -15]
    var scales: [CGFloat] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations: [CGFloat] = [-10, -10, 10, 10, 10, -10]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = introImageView.image!.size
        scrollView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = CGFloat(scrollView.contentOffset.y)
        
        let tiles = [tile1View, tile2View, tile3View, tile4View, tile5View, tile6View]
        
        var counter = 0
        
        for tile in tiles {
            
            let tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[counter], r2Max: 0)
            let ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[counter], r2Max: 0)
            let scale = convertValue(offset, r1Min: 0, r1Max: 567, r2Min: scales[counter], r2Max: 1)
            let rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[counter], r2Max: 0)
            
            counter = counter + 1
            
            tile.transform = CGAffineTransformMakeTranslation(tx, ty)
            tile.transform = CGAffineTransformScale(tile.transform, scale, scale)
            tile.transform = CGAffineTransformRotate(tile.transform, CGFloat(Double(rotation) * M_PI / 180))
        }
        
        
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
